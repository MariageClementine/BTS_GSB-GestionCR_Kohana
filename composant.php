<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Composant extends ORM
{
	protected $_table_name = 'composant';
	protected $_primary_key = 'id';
	protected $_has_many = array(
		'constitutions' => array(
			'model' => 'constitution',
			'foreign_key' => 'composant_id')
		);
}
