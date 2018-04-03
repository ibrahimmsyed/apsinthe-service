<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function login()
	{
		$method = $_SERVER['REQUEST_METHOD'];
		if($method != 'POST' && $method != 'OPTIONS' ){
			/*$empid = "IN001";
			$password = "123";
			$response = $this->MyModel->login($empid,$password);
			echo json_encode($response, JSON_NUMERIC_CHECK);*/
			//$this->response($response, 200);
			json_output(400,array('status' => 400,'message' => 'Bad request.'));
		} else {
			$params = json_decode(file_get_contents('php://input'), TRUE);
			$empid = $params['empid'];
			$password = $params['password'];
			$response = $this->MyModel->login($empid,$password);
			/* print_r("hi");
			print_r($response);die; */
			/*$x = json_encode( $response, JSON_NUMERIC_CHECK );
			var_dump($x);*/
			echo json_encode($response, JSON_NUMERIC_CHECK);
			//json_output($response['status'],$response);
		}
	}

	public function logout()
	{
		$method = $_SERVER['REQUEST_METHOD'];
		if($method != 'POST' && $method != 'OPTIONS'){
			json_output(400,array('status' => 400,'message' => 'Bad request.'));
		} else {
			$check_auth_client = $this->MyModel->check_auth_client();
			if($check_auth_client == true){
		        $response = $this->MyModel->logout();
				json_output($response['status'],$response);
			}
		}
	}
	
}
