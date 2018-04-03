<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class discussion extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
        /*
        $check_auth_client = $this->MyModel->check_auth_client();
		if($check_auth_client != true){
			die($this->output->get_output());
		}
		*/
    }

	public function index()
	{
		$users_id  =  $_GET['uid'];
		$method = $_SERVER['REQUEST_METHOD'];

		if($method != 'GET' && $method != 'OPTIONS'){
			json_output(400,array('status' => 400,'message' => $method));
		} else {
			$response = $this->MyModel->auth();
			if($response['status'] == 200){
				$resp = $this->MyModel->disc_list($users_id);
				json_output($response['status'],$resp);
			}
		}
	}
	public function list(){
		$users_id  =  $_GET['uid'];
		$method = $_SERVER['REQUEST_METHOD'];

		if($method != 'GET' && $method != 'OPTIONS'){
			json_output(400,array('status' => 400,'message' => $method));
		} else {
			$response = $this->MyModel->auth();
			if($response['status'] == 200){
				$resp = $this->MyModel->disc_list($users_id);
				json_output($response['status'],$resp);
			}
		}
	}
	public function create()
	{
		$method = $_SERVER['REQUEST_METHOD']; 
		if($method != 'POST'  && $method != 'OPTIONS'){
			json_output(400,array('status' => 400,'message' => 'Bad requests.'));
		} else {
			$response = $this->MyModel->auth();
			$respStatus = $response['status'];
			if($response['status'] == 200){
				$params = json_decode(file_get_contents('php://input'), TRUE);
				//print_r($params);die;
                if ($params['topic_title'] == "" || $params['topic_desc'] == "" || $params['topic_access'] == ""){
					$respStatus = 201;
					$resp = array('status' => 201,'message' =>  'Data\'s Missing');
				} else {
					$resp = $this->MyModel->disc_create($params);
				}
				json_output($respStatus,$resp);
			}
		}
	}

	public function update($id)
	{
		$method = $_SERVER['REQUEST_METHOD'];
		if($method != 'POST'  && $method != 'OPTIONS' || $this->uri->segment(3) == '' || is_numeric($this->uri->segment(3)) == FALSE){
			json_output(400,array('status' => 400,'message' => 'Bad request.'));
		} else {
			$response = $this->MyModel->auth();
			$respStatus = $response['status'];
			if($response['status'] == 200){
				$params = json_decode(file_get_contents('php://input'), TRUE);
				$params['updated_at'] = date('Y-m-d H:i:s');
				if ($params['converge_id'] == "" || $params['jobtype'] == "" || $params['complexity'] == "" || $params['scheduled_start_date'] == "" || $params['scheduled_end_date'] == "" || $params['publisher'] == "" || $params['pocs'] == "" || $params['scheduled_hours'] == "" ){
					$respStatus = 201;
					$resp = array('status' => 201,'message' =>  'Data\'s Missing');
				} else {
					$resp = $this->MyModel->task_update_data($id,$params);
				}
				json_output($respStatus,$resp);
			}
		}
	}

	public function delete($id)
	{
		$method = $_SERVER['REQUEST_METHOD'];
		if($method != 'DELETE' || $this->uri->segment(3) == '' || is_numeric($this->uri->segment(3)) == FALSE){
			json_output(400,array('status' => 400,'message' => 'Bad request.'));
		} else {
			$check_auth_client = $this->MyModel->check_auth_client();
			if($check_auth_client == true){
		        $response = $this->MyModel->auth();
		        if($response['status'] == 200){
		        	$resp = $this->MyModel->book_delete_data($id);
					json_output($response['status'],$resp);
		        }
			}
		}
	}

}
