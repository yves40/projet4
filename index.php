<?php

require_once 'classes/Application.php';
require_once 'controllers/siteController.php';
require_once 'controllers/AuthController.php';

$app = new Application();
$sitecontroller = new SiteController();
$AuthController = new AuthController();

$app->router->get( '/', [$sitecontroller, 'home']);

$app->router->get( '/contact', [$sitecontroller, 'contact']);
$app->router->post( '/contact', [$sitecontroller, 'handleContact']);

$app->router->get( '/login', [$AuthController, 'login']);
$app->router->post( '/login', [$AuthController, 'login']);
$app->router->get( '/register', [$AuthController, 'register']);
$app->router->post( '/register', [$AuthController, 'register']);

$app->run();

/*
    echo "<pre>";
    var_dump($this->routes);
    echo "</pre>";
*/
