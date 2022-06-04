
<?php

require_once "Router.php";
require_once "Request.php";
require_once "Response.php";

class Application {

  public static string $ROOT_DIR;
  public Router $router;
  public Request $request;
  public Response $response;
  public static Application $app;

  public function __construct($rootPath) {
      self::$ROOT_DIR = $rootPath;
      self::$app = $this;
      $this->request = new Request();
      $this->response = new Response();
      $this->router = new Router($this->request, $this->response);
  }

  function run() {
    echo $this->router->resolve();
  }

}
