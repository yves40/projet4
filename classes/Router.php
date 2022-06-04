<?php


class Router {

  protected array $routes = [];
  protected Request $request;
  protected Response $response;

  public function __construct($request, $response) {
    $this->request = $request;
    $this->response = $response;
  }

  public function get($path, $callback)
  {
    $this->routes['get'][$path] = $callback;
  } 

  public function resolve() {

    $path = $this->request->getPath();
    $method = $this->request->getMethod();
    $callback = $this->routes[$method][$path] ?? false;
    if( $callback === false ) {
      $this->response->setStatusCode(404);
      return 'Not found';
    }
    if(is_string($callback)) {
      return $this->renderView($callback);
    }
    return call_user_func($callback);
  }
  public function renderView($view) {
    $layoutContent = $this->layoutContent();
    $viewContent = $this->renderOnlyView($view);
    return str_replace('{{content}}', $viewContent, $layoutContent); // Replace content with $viewContent in $layoutContent
  }
  protected function layoutContent() {
    ob_start();       // use a buffer, does not output anything
    include_once Application::$ROOT_DIR."/views/layouts/main.php";
    return ob_get_clean();   // Returns the buffer content and clears it
  }
  protected function renderOnlyView($view) {
    ob_start();       // use a buffer, does not output anything
    include_once Application::$ROOT_DIR."/views/$view.php";
    return ob_get_clean();   // Returns the buffer content and clears it
  }
  protected function trace($var) {
    echo "<pre>";
    var_dump($var);
    echo "</pre>";    
  }
}
/*
    echo "<pre>";
    var_dump($this->routes);
    echo "</pre>";
*/