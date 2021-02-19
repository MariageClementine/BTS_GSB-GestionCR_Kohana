<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Departement extends ORM
{
	protected $_table_name = 'departement';
	protected $_primary_key = 'id';
	protected $_has_many = array(
		'visiteurs' => array(
			'model' => 'visiteur',
			'foreign_key' => 'dep_id')
		);
}