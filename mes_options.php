<?php // /!\ Important: There must be no blank space before &lt;?php or after ?&gt;
// This file was inspired from the spip contrib website
// http://www.spip.net/fr_article3811.html

if ( preg_match(',^/([\.a-zA-Z0-9_-]+)/,', $_SERVER['REQUEST_URI'], $r)
                                       AND !is_dir(_DIR_RACINE . $r[1]) ) {
      $site = $_SERVER['HTTP_HOST'] . '__' . $r[1];
} else {
      $site = $_SERVER['HTTP_HOST'];
}

// This is a symlink to /var/lib/spip/
// Sites are of the form <host> or <host>__<folder> (cf. above)
$rep = 'sites/';
$path = _DIR_RACINE . $rep . $site . '/';
 
// This will create automatically the folder structure. Disable it and create
// them manually if you wish
if(!is_dir($path)) {
      mkdir($path,0750);
      mkdir($path.'tmp',0750);
      mkdir($path.'local',0750);
      mkdir($path.'IMG',0750);
      mkdir( '/etc/webapps/spip/' . $site,0750);
      symlink( '/etc/webapps/spip/' . $site, $path . 'config');
}

// The default path for the database is in the config dir. We don't want that
// in /etc
define('_DIR_DB', $path . 'bases/');

// ajout du dossier squelette
if (is_dir($path . 'squelettes'))
      $GLOBALS['dossier_squelettes'] = $rep . $site . '/squelettes';

// spip paths
define('_SPIP_PATH',
        $path . ':' .
        _DIR_RACINE .':' .
        _DIR_RACINE .'squelettes-dist/:' .
        _DIR_RACINE .'prive/:' .
        _DIR_RESTREINT);
 

// TODO logfiles
//define('_FILE_LOG_SUFFIX', '_' . $site . '.log');
//define('_DIR_LOG',  _DIR_RACINE . 'log/');
 
// prefixes des cookie et des tables :
$cookie_prefix = str_replace('.', '_', $site);
$table_prefix = 'spip';
 
// config file (like this one) specific to the site. Note that it can override
// anything you did there, so be careful befor letting anyone modify it.
/*
if (is_readable($f = $path . _NOM_PERMANENTS_INACCESSIBLES . _NOM_CONFIG . '.php'))
        include($f);
*/
 
// start
spip_initialisation(
        ($path . _NOM_PERMANENTS_INACCESSIBLES),
        ($path . _NOM_PERMANENTS_ACCESSIBLES),
        ($path . _NOM_TEMPORAIRES_INACCESSIBLES),
        ($path . _NOM_TEMPORAIRES_ACCESSIBLES)
);
?>
