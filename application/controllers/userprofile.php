<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class userprofile extends CI_Controller {

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
				$resp = $this->MyModel->user_details($users_id);
				//json_output($response['status'],$resp);
				echo json_encode($resp, JSON_NUMERIC_CHECK);
			}
		}
	}

	public function detail($id)
	{
		$method = $_SERVER['REQUEST_METHOD'];
		if($method != 'GET' || $this->uri->segment(3) == '' || is_numeric($this->uri->segment(3)) == FALSE){
			json_output(400,array('status' => 400,'message' => 'Bad Request.'));
		} else {
			$check_auth_client = $this->MyModel->check_auth_client();
			if($check_auth_client == true){
		        $response = $this->MyModel->auth();
		        if($response['status'] == 200){
		        	$resp = $this->MyModel->book_detail_data($id);
					json_output($response['status'],$resp);
		        }
			}
		}
	}

	public function list()
	{
		$users_id  =  $_GET['uid'];
		$method = $_SERVER['REQUEST_METHOD'];

		if($method != 'GET' && $method != 'OPTIONS'){
			json_output(400,array('status' => 400,'message' => $method));
		} else {
			$response = $this->MyModel->auth();
			if($response['status'] == 200){
				$resp = $this->MyModel->users_list();
				json_output($response['status'],$resp);
			}
		}
	}

	public function create()
	{
		$method = $_SERVER['REQUEST_METHOD'];
		if($method != 'POST'){
			json_output(400,array('status' => 400,'message' => 'Bad request.'));
		} else {
			$response = $this->MyModel->auth();
			$respStatus = $response['status'];
			if($response['status'] == 200){
				$params = json_decode(file_get_contents('php://input'), TRUE);
				if ($params['title'] == "" || $params['author'] == "") {
					$respStatus = 400;
					$resp = array('status' => 400,'message' =>  'Title & Author can\'t empty');
				} else {
					$resp = $this->MyModel->book_create_data($params);
				}
				json_output($respStatus,$resp);
			}
		}
	}

	public function update($id)
	{
		$method = $_SERVER['REQUEST_METHOD'];
		if($method != 'PUT' || $this->uri->segment(3) == '' || is_numeric($this->uri->segment(3)) == FALSE){
			json_output(400,array('status' => 400,'message' => 'Bad request.'));
		} else {
			$check_auth_client = $this->MyModel->check_auth_client();
			if($check_auth_client == true){
		        $response = $this->MyModel->auth();
		        $respStatus = $response['status'];
		        if($response['status'] == 200){
					$params = json_decode(file_get_contents('php://input'), TRUE);
					$params['updated_at'] = date('Y-m-d H:i:s');
					if ($params['title'] == "" || $params['author'] == "") {
						$respStatus = 400;
						$resp = array('status' => 400,'message' =>  'Title & Author can\'t empty');
					} else {
		        		$resp = $this->MyModel->book_update_data($id,$params);
					}
					json_output($respStatus,$resp);
		        }
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
