<?php
/**
 * Created by PhpStorm.
 * User: Asus
 * Date: 19.05.2017
 * Time: 20:41
 */
class Photo
{

    /**
     * @var integer|string
     */
    protected $id;


    public function __construct($id) {
        $this->id = $id;
    }

    /**
     * @return integer|string
     */
    public function getId()
    {
        return $this->id;
    }
}