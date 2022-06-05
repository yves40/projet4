<?php

class AuthController extends Controller {

  public function login(Request $request) {

    $this->setLayout('auth');

    if($request->isPost() ) {
      return 'Handling login post data';
    }
    return $this->render('login');
  }
  public function register( Request $request) {

    $this->setLayout('auth');

    if($request->isPost() ) {
      return 'Handling register post data';
    }
    return $this->render('register');
  }

}