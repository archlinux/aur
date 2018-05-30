<html><head>
<meta http-equiv="content-type" content="text/html; charset=windows-1252">
	<style>
	    @font-face {
	        font-family: 'Quicksand';
			font-style: normal;
			font-weight: 400;
			src: local('Quicksand Regular'), local('Quicksand-Regular'), url(quicksand.ttf) format('truetype');
	    }
		
		a {
			color: black;
			text-decoration: none;
		}
		
	    h1 {
			margin-top: 0px;
			border-top: 0px;
			
			padding: 10px;
			
			background-color: grey;
			font-family: Quicksand;
			font-size: 28px;
			font-style: normal;
			font-variant: normal;
			font-weight: 500;		
			line-height: 26.4px;
			color: white;
	    }
		
	    h2 {
			padding: 0px;
			margin: 0px;
			border: 0px;
			padding-left: 10px;
			font-family: Quicksand;
			font-size: 24px;
			font-style: normal;
			font-variant: normal;
			font-weight: 500;
			line-height: 26px;
	    }
		
		h3 {
			padding: 0px;
			margin: 0px;
			border: 0px;
			padding-left: 15px;
			font-family: Quicksand;
			font-size: 18px;
			font-style: normal;
			font-variant: normal;
			font-weight: 500;
			line-height: 22px;
	    }
		
		html, body, blockquote {
			margin: 0;
			padding: 0;
			border: 0;
		}

	    div {
			padding-left: 30px;
			padding-top: 15px;
			padding-bottom: 15px;
			font-family: Quicksand;
			font-size: 16px;
			font-style: normal;
			font-variant: normal;
			font-weight: 400;
			line-height: 21px;
	    }
	</style>
    </head>
    <body>
	<blockquote>
	    <h1>Quick Service Overview</h1> 
	    <h2>Kopano - Mail access</h2>
	    <div>
			WebApp : <a href="https://<?php echo($_SERVER['HTTP_HOST']); ?>/kopano-webapp">https://<?php echo($_SERVER['HTTP_HOST']); ?>/kopano-webapp</a><br>
		</div>
	    <div>
			ActiveSync : https://<?php echo($_SERVER['HTTP_HOST']); ?><br>
			CardDav : https://<?php echo($_SERVER['HTTP_HOST']); ?>/carddav<br>
			CalDav : https://<?php echo($_SERVER['HTTP_HOST']); ?>/caldav<br>
		</div>	
		<div>
			POP3 (SSL/TLS) : <?php echo(explode(':',$_SERVER['HTTP_HOST'])[0]); ?>:995<br>
			SMTP (SSL/TLS) : <?php echo(explode(':',$_SERVER['HTTP_HOST'])[0]); ?>:465<br>
			IMAP (SSL/TLS) : <?php echo(explode(':',$_SERVER['HTTP_HOST'])[0]); ?>:993<br>
	    </div>

	    <h2>Postfix.Admin - Mail management</h2>
	    <div>
			WebInterface : <a href="https://<?php echo($_SERVER['HTTP_HOST']); ?>/kopano-postfixadmin">https://<?php echo($_SERVER['HTTP_HOST']); ?>/kopano-postfixadmin</a>
	    </div>

	</blockquote>
    
</body></html>