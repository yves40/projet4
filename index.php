<?php

require_once 'classes/Application.php';

$app = new Application(dirname(__DIR__)."/projet4");

$app->router->get( '/', 'home');
$app->router->get( '/contact', 'contact');

$app->run();

/*
    echo "<pre>";
    var_dump($this->routes);
    echo "</pre>";
*/
