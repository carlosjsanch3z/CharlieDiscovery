<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>Historial</title>
<link href="http://fonts.googleapis.com/css?family=Oswald:400,700,300" rel="stylesheet" type="text/css" />
<!-- Included CSS Files -->
<link rel="stylesheet" href="../static/stylesheets/main.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="../static/stylesheets/devices.css" type="text/css" media="screen" title="no title" charset="utf-8"  />
<link rel="stylesheet" href="../static/stylesheets/post.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="../static/stylesheets/validationEngine.jquery.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="static/stylesheets/jquery.fancybox.css?v=2.1.2" type="text/css"  media="screen" />
<!--[if IE ]>
<link rel="stylesheet" href="stylesheets/ie.css"> 
<![endif]-->
</head>

<body>

<!--********************************************* Main wrapper Start *********************************************--> 
<div id="footer_image">
<div id="main_wrapper">

    <!--********************************************* Logo Start *********************************************-->
    <div id="logo"> <a href="#"><img alt="alt_example" src="static//images/logo.png"  /></a>

    
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
      <div class="clear"></div>
    </div>
    
    <!--********************************************* Mainmenu end *********************************************--> 
        
        

     <!--********************************************* Main start *********************************************-->
     <div id="main_news_wrapper">
 
       <div id="row"> 
       <!-- Left wrapper Start -->
        <div id="hot_news">
            % for i in check:
                <div id="post_wrapper">
                    <!-- Header Start -->
                    <div id="header"> 
                        <div class="info">
                            
                            <h2>{{i['gameMode']}} 
                                <p>{{i['goldEarned']}} oro ganado | {{i['minionsKilled']}} minions | {{i['timePlayed']}}
                                minutos
                                </p>
                            </h2>
                        </div>
                       <!-- <div class="image">
                            <div class="comments"> 18 </div>
                            <div class="img_in"><img alt="alt_example" src="./images/post/post.jpg" /></div>
                        </div> -->
                    </div>
                    
                    <!-- Body Start -->
                    <div id="body">

                        <div class="post-panel">
                            <ul>
                                <li>
                                    <p></p>
                                </li>
                                <li>
                                    <p>dsdsdsdsdsds</p>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <p></p>
                                </li>
                                <li>
                                    <p>dsdsdsdsdsds</p>
                                </li>
                            </ul>
                        </div>

                        <div class="post-panel">
                            <ul>
                                % for k in i['team100']:
                                <li>
                                    <img alt="alt_example" src="http://lkimg.zamimg.com/images/v2/champions/icons/size32x32/{{i['team100'][k]}}.png" />
                                </li>
                                % end
                            </ul>
                        </div>

                        <div class="post-panel">
                            <ul>
                                % for k in i['team200']:
                                <li>
                                    <img alt="alt_example" src="http://lkimg.zamimg.com/images/v2/champions/icons/size32x32/{{i['team200'][k]}}.png" />
                                </li>
                                % end
                            </ul>
                        </div>
                        
                        <div class="post-review">
                            <div class="overall-score"><img alt="alt_example" src="http://lkimg.zamimg.com/images/v2/champions/icons/size48x48/{{i['championId']}}.png" /></div>
                            <ul>
                                <li>{{i['championsKilled']}} / {{i['numDeaths']}} / {{i['assists']}}</li>
                                <li>
                                    <img alt="alt_example" src="http://lkimg.zamimg.com/images/v2/summoner/spells/size32x32/{{i['spell1']}}.png" />
                                    <img alt="alt_example" src="http://lkimg.zamimg.com/images/v2/summoner/spells/size32x32/{{i['spell2']}}.png" />
                                </li>
                            </ul>
                        </div>
                        
                    </div>

                    <div class="clear"></div>
               </div>
            % end

                            
            </div>
            <!-- Left wrapper end -->
 
        
        </div>
      </div>
    
    <div class="bottom_shadow"></div>
  
    <!--********************************************* Main end *********************************************--> 
     
    <div class="clear"></div>

     </div>
<!--********************************************* Main_in Start *********************************************--> 
     
     <a id="cop_text" href="#"> © 2016 Charlie Discovery Tool </a>
     
    </div>
</div>
<!--********************************************* Main wrapper end *********************************************--> 

<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script src="static/javascript/getTweet.js" type="text/javascript" ></script>
<script src="static/javascript/jquery.fancybox.js?v=2.1.3" type="text/javascript" ></script>

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

