<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_m extends CI_Model {

	public function getUsers()
	{
		$this->db->select('a.user_id, a.user_name, a.user_email, a.user_realname, a.is_active, b.type_name');
		$this->db->join('tb_user_type b', 'a.type_id = b.type_id', 'inner');
		$this->db->where('user_id != ', $this->session->userdata('uid'));
		$this->db->order_by('a.user_name', 'asc');
		return $this->db->get('tb_user a')->result();
	}

	public function getUserTypes()
	{
		return $this->db->get('tb_user_type')->result();
	}

	public function getUserByHash($hash)
	{
		$this->db->select('user_name, user_realname, user_email, type_id');
		$this->db->where('md5(sha1(user_id))', verify($hash));
		return $this->db->get('tb_user')->row_array();
	}

	public function addUser($user)
	{
		return $this->db->insert('tb_user', $user) ? true : false;
	}

	public function checkUserAvailability($user, $hash = false)
	{
		$this->db->select('user_name');
		if($hash !== false){
			$this->db->group_start();
		}
		$this->db->where('user_name', $user['user_name']);
		$this->db->or_where('user_email', $user['user_email']);
		if($hash !== false){
			$this->db->group_end();
			$this->db->where('md5(sha1(user_id)) !=', verify($hash));
		}
		return $this->db->get('tb_user')->num_rows();
	}

	public function editUser($user, $hash)
	{
		$this->db->where('md5(sha1(user_id))', verify($hash));
		return $this->db->update('tb_user', $user) ? true : false;
	}

	public function deleteUser($hash)
	{
		$this->db->where('md5(sha1(user_id))', verify($hash));
		return $this->db->delete('tb_user') ? true : false;
	}
}

/* End of file user_m.php */
/* Location: ./application/models/user_m.php */