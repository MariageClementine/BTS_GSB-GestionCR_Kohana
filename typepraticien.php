<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Typepraticien extends ORM
{
	protected $_table_name = 'typepraticien';
	protected $_primary_key = 'id';
	protected $_has_many = array(
		'praticiens' => array(
			'model' => 'praticien',
			'foreign_key' => 'typepraticien_id')
		);
}