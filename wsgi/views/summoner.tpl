<!DOCTYPE html>
<html class="no-js">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Charlie Discovery</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap and Font Awesome css-->
    <link rel="stylesheet" href="static/css/font-awesome.css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <!-- Google fonts-->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Pacifico">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <!-- Theme stylesheet-->
    <link rel="stylesheet" href="static/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="static/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="static/img/bolt.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <div style="background-image: url('http://lkimg.zamimg.com/images/background.jpg')" class="main"> 
      <!-- video background-->
      <!-- replace URLs with your video content URL-->
      <!--<video id="video-background" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
        <source src="static/video/all.webm" type="video/webm">
      <!-- <source src="https://drive.google.com/file/d/0B8ExsDXbWBt8X194WV9wcm95RWs" type="video/mp4"> 
      </video> -->
      <div class="overlay"></div>
      <div class="container">
        <p class="social"><a href="#" title="" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" title="" class="twitter"><i class="fa fa-twitter"></i></a><a href="#" title="" class="gplus"><i class="fa fa-google-plus"></i></a><a href="#" title="" class="instagram"><i class="fa fa-instagram"></i></a></p>
        <h1 class="cursive">
          <img src="static/img/logotext.png">
        </h1>
        <div class="mailing-list">
          <h3 class="mailing-list-heading">{{invocador}} su ID es: {{identificador}}</h3>
          <div class="row">
            <h1>Nivel: {{level}} y codigo del icono: {{icono}}</h1>
          </div>
        </div>
      </div>
      <div class="footer">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <p>&copy; 2016 Charlie Discovery Tool</p>
            </div>
            <div class="col-md-6">
              <p class="credit">Made by <a href="">Bug3ad0</a><br />with support from <a href="https://kakusei.cz">IESGN</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- JAVASCRIPT FILES -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="javascripts/vendor/jquery-1.11.0.min.js"><\/script>')</script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/jquery.cookie.js"></script>
    <script src="static/js/front.js"></script>
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID.
    <script>
      (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
      function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
      e=o.createElement(i);r=o.getElementsByTagName(i)[0];
      e.src='//www.google-analytics.com/analytics.js';
      r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
      ga('create','UA-XXXXX-X');ga('send','pageview');
    </script>
    -->
  </body>
</html>