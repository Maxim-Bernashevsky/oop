<?php
class Controller_events extends Controller_main{

    static function main($method, $id) {
        if (self::$user = Model_User::getByToken()){
            switch ($method) {
                case 'show':
                    self::show();
                    break;
                case 'add':
                    self::add();
                    break;
                case 'edit':
                    self::edit($id);
                    break;
                case 'remove':
                    self::remove($id);
                    break;
                default:
                    self::index();
            }
            self::showPage();
        } else {
            switch ($method) {
                case 'show':
                    self::show();
                    break;
                case 'enterAuth':
                    self::enterAuth();
                    break;
                case 'enterReg':
                    self::enterReg();
                    break;
                case 'auth':
                    self::auth();
                    break;
                case 'reg':
                    self::reg();
                    break;
                default:
                    self::index();
            }
            self::showPage();
        }
    }

    // static function index() {
    // 	echo 'news ok';
    // }
    static function show() {
        // $message = Model_news::showList();
        // echo '<pre>';
        // print_r($message);
        // self::render('index/news', array('messages' => $message));
        // self::$js[]  = JS  . 'auth.js';
        self::$title = 'Показ анонсов';
        self::$js[]  = JS  . 'eventsForm.js';
        self::$main = [
            'index/events' => [
                'messages' => Model_events::showList(),
                'user' => self::$user,
            ],
        ];
        //print_r(self::$main);
        //}
    }
    static function edit($id) {
        //echo 'edit ' . $id;
        if (IS_AJAX) {

            $answer['error'] = 1;
            $answer['text']  = 'Ошибка обращения к серверу';
            $answer['type']  = 'danger';

            if (isset($id) || isset($_POST['newTitle']) || isset($_POST['newText']) || isset($_POST['newTags'])){
                $newTitle = $_POST['newTitle'];
                $newText = $_POST['newText'];
                $newTags = $_POST['newTags'];

                $data['table'] = 'events';
                $data['values'] = ['name' => $newTitle, 'date' => date('Y-m-d'), 'location' => self::$user['name'], 'text' => $newText, 'tags' => $newTags];
                $data['where'] = ['id' => $id];

                if(DB::update($data)) {
                    $answer['error'] = 0;
                    $answer['text']  = 'new edit';
                    $answer['type']  = 'success';
                } else {
                    $answer['text']  = 'Ошибка обрашения к серверу базы данных';
                    $answer['type']  = 'danger';
                }
                echo json_encode($answer);
            }
        } else {
            die('error 404');
        }
    }
    static function remove($id) {
        //echo 'remove ' . $id;
        if (is_int($id)) {
            $data['table'] = 'events';
            $data['where'] = ['id' => $id];
            if (DB::remove($data)) {
                header("Location: ".SUBSERVER."events/show/");
            } else {
                die('error 404');
            }
        }
    }
    static function add() {
        if (IS_AJAX) {

            $answer['error'] = 1;
            $answer['text']  = 'Ошибка обращения к серверу';
            $answer['type']  = 'danger';

            if (isset($_POST['eventsTitle']) || isset($_POST['eventsText']) || isset($_POST['eventsTags'])){
                $eventsTitle = $_POST['eventsTitle'];
                $eventsText = $_POST['eventsText'];
                $eventsTags = $_POST['eventsTags'];

                $data['table'] = 'events';
                $data['values'] = ['name' => $eventsTitle, 'date' => date('Y-m-d'), 'location' => self::$user['name'], 'text' => $eventsText, 'tags' => $eventsTags];

                if(DB::insert($data)) {
                    $answer['error'] = 0;
                    $answer['text']  = 'new add';
                    $answer['type']  = 'success';
                } else {
                    $answer['text']  = 'Ошибка обрашения к серверу базы данных';
                    $answer['type']  = 'danger';
                }
                echo json_encode($answer);
            }
        } else {
            die('error 404');
        }
    }
}