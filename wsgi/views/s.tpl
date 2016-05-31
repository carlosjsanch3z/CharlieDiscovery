<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>Campeones con S</title>

<link href="http://fonts.googleapis.com/css?family=Oswald:400,700,300" rel="stylesheet" type="text/css" />
<!-- Included CSS Files -->
<link rel="stylesheet" href="../static/stylesheets/main.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="../static/stylesheets/devices.css" type="text/css" media="screen" title="no title" charset="utf-8"  />
<link rel="stylesheet" href="../static/stylesheets/post.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="../static/stylesheets/validationEngine.jquery.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="../static/stylesheets/jquery.fancybox.css?v=2.1.2" type="text/css"  media="screen" />
<!--[if IE ]>
<link rel="stylesheet" href="stylesheets/ie.css"> 
<![endif]-->
<link rel="icon" href="../static/static/images/favicon.png" sizes="32x32" type="image/png">
</head>

<body>

<!--********************************************* Main wrapper Start *********************************************--> 
<div id="footer_image">
<div id="main_wrapper">

    <!--********************************************* Logo Start *********************************************-->
    <div id="logo">
      <div id="social_ctn"> 

      
      </div>
    
    </div>
    <!--********************************************* Logo end *********************************************--> 
    
    <!--********************************************* Main_in Start *********************************************-->
    <div id="main_in">  
      
    <!--********************************************* Mainmenu Start *********************************************-->
      <div id="menu_wrapper">
      <div id="menu_left"></div>
        <div id="search">
            <form action="/summoner" method="post">
            <input type="text" placeholder="Buscar otro jugador" name="summoner" class="required" required/>
            <input type="submit" />
            </form>
        </div>
      <div id="menu_right"></div>
    </div>
    
    <!--********************************************* Mainmenu end *********************************************--> 
        
        

     <!--********************************************* Main start *********************************************-->

            <!-- Full page wrapper Start -->
            <div id="full_page_wrapper">
                    	
                <div class="header">
                	<h2><span>Nombre del jugador //</span> tiene una S con los siguientes campeones:</h2>
                </div>
                
                <!-- Gallery wrapper Start --> 
                <ul id="gallery_wrapper">
                	<!--<li><a class="shadowbox fancybox.iframe" href="http://www.youtube.com/embed/BBBQnzWWPfE?autoplay=1" rel="main_gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>-->
                    % for image in iconos:
                        <li><a class="shadowbox" href="#" rel="gallery" ><img alt="alt_example" src="{{image}}"/></a>
                        </li>
                    % end
               </ul>
               <!-- Gallery wrapper end --> 
               <div> 
            </div>
            <div class="clear"></div>              
            </div>
            <!-- Full page wrapper end -->

        <div class="bottom_shadow"></div>	
	<!--********************************************* Main end *********************************************-->


     </div>
<!--********************************************* Main_in Start *********************************************--> 
     
     <a id="cop_text" href="#"> © 2016 Charlie Discovery Tool </a>
     
	</div>
</div>
<!--********************************************* Main wrapper end *********************************************--> 

<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script src="../static/javascript/getTweet.js" type="text/javascript" ></script>
<script src="../static/javascript/jquery.fancybox.js?v=2.1.3" type="text/javascript" ></script>

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
