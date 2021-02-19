<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Travaille extends ORM
{
	protected $_table_name = 'travaille';
	protected $_primary_key = 'id';
	protected $_belongs_to = array(
		'praticien' => array(
			'model' => 'praticien',
			'foreign_key' => 'praticien_id'),
                'cabinet' => array(
			'model' => 'cabinet',
			'foreign_key' => 'cabinet_id')
		); 
}