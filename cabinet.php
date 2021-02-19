<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Cabinet extends ORM
{
	protected $_table_name = 'cabinet';
	protected $_primary_key = 'id';
	protected $_has_many = array(
		'travailles' => array(
			'model' => 'travaille',
			'foreign_key' => 'cabinet_id')
		);
}