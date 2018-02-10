<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class MyModel extends CI_Model {

    
    public function login($empid,$password)
    {   
        
        $q  = $this->db->select('password,uid,role')->from('userprofile')->where('emp_id',$empid)->get()->row();
      
        if($q == ""){
            //return array('status' => 204,'message' => 'Username not found.');
            return array('status' => 201,'message' => 'EMP ID not found.');
        } else {
            $hashed_password = $q->password;
            $id              = $q->uid;
            $userrole              = $q->role;
           // $hashed_password1 = crypt('123');

           
            if (hash_equals($hashed_password, crypt($password, $hashed_password))) {
               $last_login = date('Y-m-d H:i:s');
               $token = crypt(substr( md5(rand()), 0, 7));
               $expired_at = date("Y-m-d H:i:s", strtotime('+12 hours'));
               $this->db->trans_start();
               $this->db->where('uid',$id)->update('userprofile',array('last_seen' => $last_login,'token_id' => $token,'expired_at' => $expired_at,));
               //$this->db->insert('users_authentication',array('users_id' => $id,'token_id' => $token,'expired_at' => $expired_at));
               if ($this->db->trans_status() === FALSE){
                  $this->db->trans_rollback();
                  return array('status' => 500,'message' => 'Internal server error.');
               } else {
                  $this->db->trans_commit();
                  return array('status' => 200,'message' => 'Successfully login.','id' => $id, 'token_id' => $token,'user-role' => $userrole);
               }
            } else {
               return array('status' => 201,'message' => 'Wrong password.');
            }
        }
    }

    public function logout()
    {
        $users_id  = $_GET['user-id'];
        $token  = $_GET['token_id'];
        $this->db->where('users_id',$users_id)->where('token_id',$token)->delete('users_authentication');
        return array('status' => 200,'message' => 'Successfully logout.');
    }

    public function auth()
    {
        $method = $_SERVER['REQUEST_METHOD'];
       
       
        if($method == "GET"){
            $users_id  =  $_GET['uid'];
            $token  = $_GET['token'];
        }else{
            $params = json_decode(file_get_contents('php://input'), TRUE);
            $users_id  =  $params['uid'];
            $token  = $params['token'];
        }

        $q  = $this->db->select('expired_at')->from('userprofile')->where('uid',$users_id)->where('token_id',$token)->get()->row();
        if($q == ""){
            return json_output(201,array('status' => 201,'message' => "Error"));
        } else {
            if($q->expired_at < date('Y-m-d H:i:s')){
                return json_output(401,array('status' => 401,'message' => 'Your session has been expired.'));
            } else {
                $updated_at = date('Y-m-d H:i:s');
                $expired_at = date("Y-m-d H:i:s", strtotime('+12 hours'));
                $this->db->where('uid',$users_id)->where('token_id',$token)->update('userprofile',array('expired_at' => $expired_at,'updated_at' => $updated_at));
                return array('status' => 200,'id'=> $users_id,'message' => 'Authorized.');
            }
        }
    }

    public function user_details($id)
    {
        return $this->db->select('uid,emp_id,fname,lname,gender,dob,doj,email_id,designation,team,dept,division,contact_no,emergency_contact_no,role,profile_pic,shift_type')->from('userprofile')->where('UID',$id)->order_by('uid','desc')->get()->result();
    }
    public function task_list($id)
    {
        return $this->db->select('*')->from('tasks')->where('uid',$id)->order_by('uid','desc')->get()->result();
    }
    public function task_create($data)
    {
        $this->db->insert('tasks',$data);
        return array('status' => 201,'message' => 'Data\'s has been created.');
    }

    public function book_detail_data($id)
    {
        return $this->db->select('id,title,author')->from('books')->where('id',$id)->order_by('id','desc')->get()->row();
    }

    

    public function book_update_data($id,$data)
    {
        $this->db->where('id',$id)->update('books',$data);
        return array('status' => 200,'message' => 'Data has been updated.');
    }

    public function book_delete_data($id)
    {
        $this->db->where('id',$id)->delete('books');
        return array('status' => 200,'message' => 'Data has been deleted.');
    }

}
