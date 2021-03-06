<!DOCTYPE html>
<html>
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
<link rel="icon" href="../static/images/favicon.png" sizes="32x32" type="image/png">
</head>

<body>

<!--********************************************* Main wrapper Start *********************************************--> 
<div id="footer_image">
<div id="main_wrapper">

    <!--********************************************* Logo Start *********************************************-->
    <div id="logo">

    
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
                            % if i['win'] == "True":
                                <h2>
                                    <img alt="alt_example" src="http://lkimg.zamimg.com/images/v2/champions/icons/size48x48/{{i['championId']}}.png" />
                                    <span class="white">{{i['gameMode']}} </span>
                                    {{i['goldEarned']}} oro ganado <img src="http://matchhistory.euw.leagueoflegends.com/assets/1.0.11/css/resources/images/scoreboardicon_items.png"> {{i['minionsKilled']}} minions <img src="http://matchhistory.euw.leagueoflegends.com/assets/1.0.11/css/resources/images/scoreboardicon_minion.png"> {{i['timePlayed']}}
                                    minutos
                                    <span class="green-victory">VICTORIA</span>
                                </h2>
                            % elif i['win'] == "False":
                                <h2><img alt="alt_example" src="http://lkimg.zamimg.com/images/v2/champions/icons/size48x48/{{i['championId']}}.png" />
                                    <span class="white">{{i['gameMode']}} </span>
                                    {{i['goldEarned']}} oro ganado <img src="http://matchhistory.euw.leagueoflegends.com/assets/1.0.11/css/resources/images/scoreboardicon_items.png"> {{i['minionsKilled']}} minions <img src="http://matchhistory.euw.leagueoflegends.com/assets/1.0.11/css/resources/images/scoreboardicon_minion.png"> {{i['timePlayed']}}
                                    minutos
                                    <span class="red-defeat">DERROTA</span>
                                </h2>
                            % end
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
                                    <p><span class="purple">Equipo morado</span></p>
                                </li>
                                <li>
                                % for k in i['team200']:
                                    % if i['team200'][k] == 163:
                                        <img class="taliyah" alt="alt_example" src="http://ddragon.leagueoflegends.com/cdn/6.10.1/img/champion/Taliyah.png" />
                                    % else:
                                        <img alt="alt_example" src="http://lkimg.zamimg.com/images/v2/champions/icons/size32x32/{{i['team200'][k]}}.png" />
                                    % end
                                % end
                                </li>
                            </ul>
                        </div>

                        <div class="post-panel">
                            <ul>
                                <li>
                                    <p><span class="blue">Equipo azul</span></p>
                                </li>
                                <li>
                                % for k in i['team100']:
                                    % if i['team100'][k] == 163:
                                        <img class="taliyah" alt="alt_example" src="http://ddragon.leagueoflegends.com/cdn/6.10.1/img/champion/Taliyah.png" />
                                    % else:
                                        <img alt="alt_example" src="http://lkimg.zamimg.com/images/v2/champions/icons/size32x32/{{i['team100'][k]}}.png" />
                                    % end
                                % end
                                </li>
                            </ul>
                        </div>

                        <div class="post-review">
                            <ul>
                                <li>
                                    <p><span class="verde">{{i['championsKilled']}}</span> K <span class="rojo">{{i['numDeaths']}}</span> D <span class="orange">{{i['assists']}}</span> A</p>
                                </li>
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

