<?php
include_once 'text.php';

class Model_events extends Text {
    protected $author;
    protected $type = 'events';

    function save() {}
    function update() {}
    function delete() {}
    function show() {}
    static function showList() {
        $info = DB::getAll('
			SELECT * FROM `events`;
		');
        return $info;
    }
}

// DB::connect('localhost', 'root', '', 'oop');
// $news = new News(1);
// echo '<pre>';
// print_r($news);