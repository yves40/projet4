<?php

require_once 'classes/Application.php';

$app = new Application();

$app->router->get( '/', function () {
  return '/ path called';
});

$app->router->get( '/contact', 'contact');

$app->run();

/*
    echo "<pre>";
    var_dump($this->routes);
    echo "</pre>";
*/
