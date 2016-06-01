<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Advice Twitter</title>

	<link rel="stylesheet" href="static/assets/demo.css">
	<link rel="stylesheet" href="static/assets/form-basic.css">
    <link rel="stylesheet" href="static/assets/form-register.css">

</head>


	<header>
		<h1>Notificador de juego</h1>
        <a href="http://charliediscovery-charliejsanchez.rhcloud.com/">Inicio</a>
    </header>

    <div class="main-content">
        <!-- <a href="#" class="form-log-in-with-existing">Se ha avisado a los jugadores correctamente →</a> -->
        <!-- You only need this form and the form-basic.css -->

        <form class="form-basic" action="/twittear" method="post">

            <div class="form-title-row">
                <h1>Avisa a tus amigos</h1>

            </div>

            <div class="form-row">
                <label>
                    <span>Soy</span>
                    <input type="text" name="summoner" placeholder="Tu nombre de invocador">
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>Jugaría una: </span>
                    <select name="partida">
                        <option value="NORMAL">normal</option>
                        <option value="ARAM">ARAM</option>
                        <option value="RANKED">Ranked</option>
                        <option value="URF">URF</option>
                        <option value="3vs3">3 vs 3</option>
                    </select>
                </label>
            </div>
<!--
            <div class="form-row">
                <label><span>Jugaré</span></label>
                <div class="form-radio-buttons">

                    <div>
                        <label>
                            <input type="radio" name="cantidad">
                            <span>1 partida</span>
                        </label>
                    </div>

                    <div>
                        <label>
                            <input type="radio" name="cantidad">
                            <span>2-3 partidas</span>
                        </label>
                    </div>

                    <div>
                        <label>
                            <input type="radio" name="cantidad">
                            <span>Hasta el amanecer</span>
                        </label>
                    </div>

                </div>
            </div>
-->
            <div class="form-row">
                <!--<button type="submit">Avisar</button>-->
                <input type="submit" />
            </div>

        </form>

    </div>

</body>

</html>
