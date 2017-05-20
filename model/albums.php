<?php
include_once "photo.php";
include_once 'content.php';

class Model_albums extends Content {
    public $dir;
    public $type = 'albums';
    public static $photos = array();

    function save() {}
    function update() {}
    function delete() {}
    function show() {}
    static function showList() {
        $info = DB::getAll('
			SELECT `albums`.`id` AS `id`,
		`albums`.`name`,
        `albums`.`date`,
        `albums`.`dir`,
        `photos`.`id` AS `id_photo`,
        `photos`.`url` AS `photo_url`,
        `photos`.`id_album`
          FROM `albums` 
			LEFT JOIN `photos` 
			 ON `albums`.`id` = `photos`.`id_album`;
		');
        return $info;
    }
    public static function pushPhoto(Photo $photo) {
        self::$photos[$photo->getId()] = $photo;
    }

    public static function getPhoto($id) {
        return isset(self::$photos[$id]) ? self::$photos[$id] : null;
    }

    public static function removePhoto($id) {
        if (array_key_exists($id, self::$photos)) {
            unset(self::$photos[$id]);
        }
    }
}
//$album = new Model_albums('ididid');
//$album->dir = 'efewfwef';
//$album->name = 'sdwedwef';
//echo '<pre>';
//print_r($album);