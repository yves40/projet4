
<?php

require_once "Router.php";
require_once "Request.php";
require_once "Response.php";

class Application {

  public static string $ROOT_DIR;
  public static string $DOCUMENT_ROOT;
  public Router $router;
  public Request $request;
  public Response $response;
  public static Application $app;
  public Controller $controller;

  public function __construct() {
    self::$ROOT_DIR = $_SERVER['DOCUMENT_ROOT'];
    //$this->trace(self::$ROOT_DIR, 'Application constructor', 'ROOT_DIR set : ');
    self::$app = $this;
    $this->request = new Request();
    $this->response = new Response();
    $this->controller = new Controller();
    $this->router = new Router($this->request, $this->response);
  }

  public function run() {
    echo $this->router->resolve();
  }

  public function getController() {
    return $this->controller;
  }

  public function setController($cont) {
    $this->controller = $cont;
  }
  //-----------------------------------------------------------------------------
  //-----------------------------------------------------------------------------
  public function trace($var, $module = '', $mess = '' ) {
    echo "<pre>";
    echo '['.$module.']['.$mess.']'; 
    var_dump($var);
    echo "</pre>";    
  }

}
