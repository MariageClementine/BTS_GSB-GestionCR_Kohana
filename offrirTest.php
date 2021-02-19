<?php

/**
 * Generated by PHPUnit_SkeletonGenerator 1.2.1 on 2014-03-22 at 07:11:59.
 */
class Model_OffrirTest extends PHPUnit_Framework_TestCase {

    public function dataCheckQte() {
        return array(
            array(array(
                    'string' => '12',
                    'return' => true
                )),
            array(array(
                    'string' => '12 ',
                    'return' => true
                )),
            array(array(
                    'string' => '123',
                    'return' => false
                )),
            array(array(
                    'string' => 'aze',
                    'return' => false
                ))
        );
    }

    /**
     * @dataProvider dataCheckQte
     */
    public function testCheckQte($data) {
        $offre = New Model_Offrir();
        $chaine = $data['string'];
        $result = $offre->checkQte($chaine);
        $this->assertEquals($data['return'], $result);
        $this->assertSame($data['return'], $result);
    }

}
