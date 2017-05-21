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
			SELECT *
          FROM `albums` 
		');
        foreach ($info as $key => &$album) {
            $photos = DB::getAll(
                'SELECT * FROM `photos`
                  WHERE `id_album` = '.$album['id']
            );
            $album['photos'] = $photos;
        }
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