<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Labo extends ORM
{
	protected $_table_name = 'labo';
	protected $_primary_key = 'id';
	protected $_has_many = array(
		'visiteurs' => array(
			'model' => 'visiteur',
			'foreign_key' => 'labo_id')
		);
}