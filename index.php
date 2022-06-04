<?php

require_once 'classes/Application.php';
require_once 'controllers/siteController.php';

$app = new Application(dirname(__DIR__)."/projet4");
$sitecontroller = new SiteController();

$app->router->get( '/', [$sitecontroller, 'home']);
$app->router->get( '/contact', [$sitecontroller, 'contact']);
$app->router->post( '/contact', [$sitecontroller, 'handleContact']);

$app->run();

/*
    echo "<pre>";
    var_dump($this->routes);
    echo "</pre>";
*/
