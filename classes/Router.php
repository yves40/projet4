<?php


class Router {

  protected array $routes = [];
  protected Request $request;
  protected Response $response;
  //-----------------------------------------------------------------------------
  public function __construct($request, $response) {
    $this->request = $request;
    $this->response = $response;
  }

  //-----------------------------------------------------------------------------
  public function get($path, $callback)
  {
    $this->routes['get'][$path] = $callback;
  } 
  //-----------------------------------------------------------------------------
  public function post($path, $callback)
  {
    $this->routes['post'][$path] = $callback;
  } 

  //-----------------------------------------------------------------------------
  public function resolve() {

    $path = $this->request->getPath();
    $method = $this->request->getMethod();
    $callback = $this->routes[$method][$path] ?? false;
    if( $callback === false ) {
      $this->response->setStatusCode(404);
      return $this->renderView('_404');
    }
    if(is_string($callback)) {
      return $this->renderView($callback);
    }
    return call_user_func($callback);   // In this case the callback is an array
                                        // containing a class and a method of that class
  }
  //-----------------------------------------------------------------------------
  public function renderView($view, $params = []) {
    $layoutContent = $this->layoutContent();
    $viewContent = $this->renderOnlyView($view, $params);
    return str_replace('{{content}}', $viewContent, $layoutContent); // Replace content with $viewContent in $layoutContent
  }
  //-----------------------------------------------------------------------------
  protected function layoutContent() {
    ob_start();       // use a buffer, does not output anything
    include_once Application::$ROOT_DIR."/views/layouts/main.php";
    return ob_get_clean();   // Returns the buffer content and clears it
  }
  //-----------------------------------------------------------------------------
  protected function renderOnlyView($view, $params) {
    foreach($params as $key => $value) {  // Add passed params to the request
      $$key = $value;
    }
    ob_start();       // use a buffer, does not output anything
    include_once Application::$ROOT_DIR."/views/$view.php";
    return ob_get_clean();   // Returns the buffer content and clears it
  }
  //-----------------------------------------------------------------------------
  protected function trace($var) {
    echo "<pre>";
    var_dump($var);
    echo "</pre>";    
  }
}
