<?php

require_once 'Controller.php';

class SiteController extends Controller {

  public function contact() {
    return $this->render('contact');   // The render method comes from the superclass
  }

  public function home() {
    $params = [
      'name' => 'Yves 40'
    ];
    return $this->render('home', $params);
  }

  public function handleContact(Request $request) {
    $body = $request->getBody();
    Application::$app->trace($body);
    return 'handle contact form submission';
  }

}

?>