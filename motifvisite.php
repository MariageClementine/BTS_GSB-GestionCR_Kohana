<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Motifvisite extends ORM
{
	protected $_table_name = 'motifvisite';
	protected $_primary_key = 'id';
	protected $_has_many = array(
		'rapportvisites' => array(
			'model' => 'rapportvisite',
			'foreign_key' => 'motif_id')
		);
}