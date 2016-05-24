<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>Profile</title>
<link href="http://fonts.googleapis.com/css?family=Oswald:400,700,300" rel="stylesheet" type="text/css" />
<!-- Included CSS Files -->
<link rel="stylesheet" href="static/stylesheets/main.css" />
<link rel="stylesheet" href="static/stylesheets/devices.css" />
<link rel="stylesheet" href="static/stylesheets/paralax_slider.css" />
<link rel="stylesheet" href="static/stylesheets/bxSlider.css" />
<link rel="stylesheet" href="static/stylesheets/jquery.fancybox.css?v=2.1.2" type="text/css"  media="screen" />
<!--[if IE]>
<link rel="stylesheet" href="stylesheets/ie.css"> 
<![endif]-->


</head>

<body>

<!--********************************************* Main wrapper Start *********************************************-->
<div id="footer_image">
  <div id="main_wrapper"> 
    
    <!--********************************************* Logo Start *********************************************-->
    <div id="logo"> <a href="#"><img alt="alt_example" src="{{urlimageicon}}"  /></a>    </div>
    

    <!--********************************************* Logo end *********************************************--> 
    
    <!--********************************************* Main_in Start *********************************************-->
    <div id="main_in"> 
   

      
    
    <div class="top_shadow"></div>
    
    <!--********************************************* Hot news start *********************************************-->
    <div id="hot_news">
      <div class="header">
        <h1 class="{{color}}"><span>{{name}} //</span> {{isplaying}}</h1>
      </div>
      
      <!-- Previous and next selector --> 
      <a id="prev" class="prev" href="#"><img alt="alt_example" src="static/images/blank.gif" width="21" height="33" border="0" /></a> <a id="next" class="next" href="#"><img alt="alt_example" src="static/images/blank.gif" width="21" height="33" border="0" /></a>
      <ul id="hot_news_box">
        <li>
          <h2><a href="./post.html">RANKED SOLO 5 VS 5</a></h2>
          <div class="image" style="width: 100px;height: 100px;"><a href="./post.html"><img alt="alt_example" src="http://lkimg.zamimg.com/images/medals/{{tier5x5}}.png"/></a></div>
          <div class="content" style="width: 125px;height: 100px;">
            <p>{{division5x5}}</p>
            <p>{{leagueofpoints}} LP</p>
            <div class="info"> <a href="./post.html" class="comments verde"><span>{{wins5x5}}</span> wins</a> <a href="./post.html" class="comments rojo"><span>{{losses5x5}}</span> losses</a> </div>
          </div>
        </li>
        <li>
          <h2><a href="./post.html">TEAM 3v3</a></h2>
          <div class="image" style="width: 100px;height: 100px;"><a href="./post.html"><img alt="alt_example" src="http://lkimg.zamimg.com/images/medals/unknown.png"/></a></div>
          <div class="content" style="width: 125px;height: 100px;">
            <p>tier</p>
            <p>leaguePoints</p>
            <div class="info"> <a href="./post.html" class="comments"><span>18</span> wins</a> <a href="./post.html" class="comments"><span>18</span>losses</a> </div>
          </div>
        </li>
        <li>
          <h2><a href="./post.html">TEAM 5v5</a></h2>
          <div class="image" style="width: 100px;height: 100px;"><a href="./post.html"><img alt="alt_example" src="http://lkimg.zamimg.com/images/medals/unknown.png"/></a></div>
          <div class="content" style="width: 125px;height: 100px;">
            <p>tier</p>
            <p>leaguePoints</p>
            <div class="info"> <a href="./post.html" class="comments"><span>18</span> wins</a> <a href="./post.html" class="comments"><span>18</span>losses</a> </div>
          </div>
        </li>
      </ul>
    </div>
    <!--********************************************* Hot news end *********************************************--> 
    
    <!--********************************************* Main start *********************************************-->
    <div id="main_news_wrapper">
 
       <div id="row"> 
        <!-- Left wrapper Start -->
        <div id="wrapper">

          
          
          <div class="clear"></div>
         
        <!-- Left wrapper end --> 
        
        <!-- Right wrapper Start -->
        <div  id="right_wrapper">
          <div id="search">
            <input type="text" onblur="if(this.value =='') this.value='search'" onfocus="if (this.value == 'search') this.value=''" value="search" name="s" class="required" id="s" />
            <input type="button" />
          </div>
         </div>
          
      
      <!-- Right wrapper end -->
      
        </div>
      	<div class="clear"></div>
        
        </div>
      </div>
    
    <div class="bottom_shadow"></div>
  
    <!--********************************************* Main end *********************************************--> 
    
    <div class="clear"></div>
 
  
  </div>
  <!--********************************************* Main_in end *********************************************--> 
  
  <a id="cop_text" href="#"> © 2016 Charlie Discovery Tool  </a> 
  </div>
</div>
<!--********************************************* Main wrapper end *********************************************--> 


<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script> 
<script src="static/javascript/jquery.carouFredSel-6.1.0.js" type="text/javascript"></script> 
<script src="static/javascript/jquery.cslider.js" type="text/javascript" ></script> 
<script src="static/javascript/modernizr.custom.28468.js" type="text/javascript"></script> 
<script src="static/javascript/getTweet.js" type="text/javascript" ></script> 
<script src="static/javascript/jquery.fancybox.js?v=2.1.3" type="text/javascript" ></script> 



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

<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script> 
<script src="static/javascript/jquery.carouFredSel-6.1.0.js" type="text/javascript"></script>
<script src="static/javascript/jquery.cslider.js" type="text/javascript" ></script>  
<script src="static/javascript/jquery.bxSlider.min.js" type="text/javascript"></script> 
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
				items			: 3,
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
jQuery(function ($) {
	$('#homepage-carousel').bxSlider({
		'prev': false
		,	'next': false
		,    mode : 'fade'
		,	pager: true
	});
	$('.homepage-news-item').show();
	var x = $('div.tabs');
	$.each(x, function (i) {
		var f = i + 1; 
		$('.pager-' + f).empty();
		$(this).appendTo('.pager-' + f);
	});
});
</script> 

<!--******* Javascript Code for the Main banner mobile version *******--> 
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
</body>
</html>


