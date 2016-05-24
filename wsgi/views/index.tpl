<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>Discovery</title>
<link href="http://fonts.googleapis.com/css?family=Oswald:400,700,300" rel="stylesheet" type="text/css" />
<!-- Included CSS Files -->
<link rel="stylesheet" href="static/stylesheets/main.css" />
<link rel="stylesheet" href="static/stylesheets/devices.css" />
<link rel="stylesheet" href="static/stylesheets/paralax_slider.css" />
<link rel="stylesheet" href="sstatic/tylesheets/jquery.fancybox.css?v=2.1.2" type="text/css"  media="screen" />
<!--[if IE]>
<link rel="stylesheet" href="stylesheets/ie.css"> 
<![endif]-->

<style type="text/css">

.verde {
  color: #20C715;
}

.rojo {
  color: #E00404;
}


</style>

</head>

<body>

<!--********************************************* Main wrapper Start *********************************************-->
<div id="footer_image">
  <div id="main_wrapper"> 
    
    <!--********************************************* Logo Start *********************************************-->
    <div id="logo"> <a href="#"><img alt="alt_example" src="static//images/logotext.png"  /></a>

      <div id="menu_wrapper">
      <div id="row">
        <div id="menu">
          <div id="search">
            <form action="/summoner" method="post">
            <input type="text" placeholder="Nombre del invocador" name="invocador" class="required" required/>
            <input type="submit" />
            </form>
          </div>
        </div>
      </div>
      <div class="clear"></div>
    </div>
    
    </div>
    <!--********************************************* Logo end *********************************************--> 
    
    <!--********************************************* Main_in Start *********************************************-->
    <div id="main_in"> 
    
    <!--********************************************* Mainmenu end *********************************************--> 
    
    <!--********************************************* Banner start *********************************************-->
    <div id="da-slider" class="da-slider">
      <div class="da-slide">
        <h2><a href="#" class="da-link">Adbcdfef</a></h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br />
          Ut iaculis lorem vitae arcu elementum pellentesque. <br />
          Praesent pellentesque ornare neque id lobortis.</p>
        <div class="da-img"><img alt="alt_example" src="http://lkimg.zamimg.com/images/home/widget/xerath_widget_01.jpg"  /></div>
      </div>
      <div class="da-slide">
        <h2><a href="#" class="da-link">dsdsdsds</a></h2>
        <p>Phasellus ac leo turpis. Morbi at pulvinar augue. <br />
          Aenean rhoncus ultrices volutpat. Vivamus eget enim ut orci iaculis condimentum sed a quam. </p>
        <div class="da-img"><img alt="alt_example" src="http://lkimg.zamimg.com/images/home/widget/fizz_widget_01.jpg"  /></div>
      </div>
      <div class="da-slide">
        <h2><a href="#" class="da-link">dsdsdsds</a></h2>
        <p>Etiam eu massa lectus. Nunc mi velit, commodo ut ullamcorper et, consectetur vel dolor. Etiam tincidunt convallis metus non suscipit.</p>
        <div class="da-img"><img alt="alt_example" src="http://lkimg.zamimg.com/images/home/widget/ezreal_widget_03.jpg"  /></div>
      </div>
      <div class="da-arrows"> <span class="da-arrows-prev"></span> <span class="da-arrows-next"></span> </div>
    </div>
    
    <!--********************************************* Banner end *********************************************-->

  
    
    
    <!--********************************************* Footer start *********************************************-->
    <div id="footer">
    <div class="row">
      <div class="footer_widget">
        <div class="header"><a href="#">Estado del servidor</a></div>
        <div class="body">
          <div><img alt="alt_example" class="statuserver" src="static//images/serverstatus.png" align="left"/>
            <br>
          </div>
           
          %  for key in game:
          %  if game[key] == 'online':
                <p>{{key}}: <a href="#" class="verde">{{game[key]}}</a></p>
          % elif game[key] == 'offline':
                <p>{{key}}: <a href="#" class="rojo">{{game[key]}}</a></p>
          %   end
          % end
        </div>
        <div class="footer">Version actual del juego: {{version}}</div>
      </div>
      <div class="divider_footer"></div>
      <div id="latest_media">
        <div class="header"><a href="#">Campeones gratuitos de la semana</a></div>
        <div class="body">
          <ul id="l_media_list">
            % for i in iconos:
            <li><a class="shadowbox" href="#" rel="gallery" ><img alt="alt_example" src="{{i}}" /></a></li>
            % end
          </ul>
        </div>
      </div>
      <div class="clear"></div>
    </div>
    </div>
    <!--********************************************* Footer end *********************************************--> 
    <div class="clear"></div>
  
  </div>
  <!--********************************************* Main_in end *********************************************--> 
  
  <a id="cop_text" href="http://themeforest.net/user/Skywarrior"> © 2016 Charlie Discovery Tool </a> 
  </div>
</div>
<!--********************************************* Main wrapper end *********************************************--> 

<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script> 
<script src="static/javascript/jquery.carouFredSel-6.1.0.js" type="text/javascript"></script> 
<script src="static/javascript/jquery.cslider.js" type="text/javascript" ></script> 
<script src="static/javascript/modernizr.custom.28468.js" type="text/javascript"></script> 
<script src="static/javascript/getTweet.js" type="text/javascript" ></script> 
<script src="static/javascript/jquery.fancybox.js?v=2.1.3" type="text/javascript" ></script> 

<!--******* Javascript Code for the Hot news carousel *******--> 
<script type="text/javascript">
	$(document).ready(function() {
	
		// Using default configuration
		$("#sd").carouFredSel();
		
		// Using custom configuration
		$("#hot_news_box").carouFredSel({
			items				: 3,
			direction			: "right",
			prev: '#prev',
			next: '#next',
			scroll : {
				items			: 1,
				height			: 250,
				easing			: "quadratic",
				duration		: 2000,							
				pauseOnHover	: true
			}	
		});	
	})
</script> 


<!--******* Javascript Code for the Main banner *******--> 
<script type="text/javascript">
	$(function() {
	
		$('#da-slider').cslider({
			autoplay	: true,
			bgincrement	: 450
		});
	
	});
</script> 

<!--******* Javascript Code for the image shadowbox *******--> 
<script type="text/javascript">
$(document).ready(function() {
	/*
	*  Simple image gallery. Uses default settings
	*/
	
	$('.shadowbox').fancybox();
});
</script>

<!--******* Javascript Code for the menu *******-->

<script type="text/javascript">
    $(document).ready(function() {
        $('#menu li').bind('mouseover', openSubMenu);
        $('#menu > li').bind('mouseout', closeSubMenu);

        function openSubMenu() {
            $(this).find('ul').css('visibility', 'visible');
        };

        function closeSubMenu() {
            $(this).find('ul').css('visibility', 'hidden');
        };
    });
</script>

<script type="text/javascript">
    $(function() {
        var pull    = $('#pull');
        menu 		= $('ul#menu');

        $(pull).on('click', function(e) {
            e.preventDefault();
            menu.slideToggle();
        });

        $(window).resize(function(){
            var w = $(window).width();
            if(w > 767 && $('ul#menu').css('visibility', 'hidden')) {
                $('ul#menu').removeAttr('style');
            };
            var menu = $('#menu_wrapper').width();
            $('#pull').width(menu - 20);
        });
    });
</script>

<script type="text/javascript">
    $(function() {
        var menu = $('#menu_wrapper').width();
        $('#pull').width(menu - 20);
    });
</script>
</body>
</html>
