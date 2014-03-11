<?php

/**********************************
 * CONFIGURATION FILE FOR AGUILAS *
 **********************************/

/* ========== Branding ========== */

//  Name
/// Name of the Application. e.g. "Debian User Management"
$app_name = "Aguilas User Management";
//  Operator
/// The person or group responsible for managing the application. e.g. "Venezuela Linux User Group"
$app_operator = "Organization";
//  Application e-mail
/// The e-mail address that will appear as sender in all operation e-mails to registered users.
$app_mail = "admin@example.com";
//  Operator e-mail
/// The e-mail address you wish to use for sending error reports
$op_mail = "aguilas@example.com";
//  Application language
/// The language that you wish to see in your application. Must be available in the po/ folder
$app_locale = "en_US";
//  Application theme
/// The theme applied to the application. Must be available in the themes/ folder
$app_theme = "canaima";
// Application URL
// The public address of the aplication, in the form of "example.org" (without http://)
$app_url = $_SERVER['SERVER_NAME']."/aguilas";
// Application links
// an array of link_title => link of the applications connected
// to the LDAP and whose registration process have been delegated to AGUILAS
// this will appear on the main menu
$app_links = array(	"APP1" => "http://$app_url",
			"APP2" => "http://$app_url",
			"APP3" => "http://$app_url",
			"APP4" => "http://$app_url"
		);
// Application log directory
// the directory where the logs are going to be stored
// has to be writable by www-data
$log_dir = "/var/log/aguilas/";


/* ========== MYSQL Database ========== */

/// IP or Domain of the server where the MYSQL database is located
$mysql_host = "localhost";
/// Database name (will be created if it does not exist)
$mysql_dbname = "aguilas";
/// User with permissions to read and create tables on the database
$mysql_user = "mysql_user";
/// Password for the user
$mysql_pass = "mysql_password";


/* ========== LDAP Database ========== */

/// IP or Domain of the server where the LDAP service is located
$ldap_server = "localhost";
// Port for connecting to the server
// 389 for non-secure connection
// 636 for secure connection
// must be an integer
$ldap_port = 389;
/// DN with read-write priviledges on the LDAP server
$ldap_dn = "cn=root,dn=example,dn=com";
/// Password for the writer DN
$ldap_pass = "ldap_password";
/// Base DN to perform searches and include new users
$ldap_base = "dn=example,dn=com";
// Encrypt algorithm used to save passwords on LDAP
// Options:
// CLEAR | MD5 | SHA | CRYPT | SSHA | SMD5 | BLOWFISH | EXT_DES | MD5CRYPT
$ldap_enc = "SSHA";
// Use secure tunnel connection (TLS)
// Must have a valid certificate for autentication
// Options:
// FALSE = Don't use TLS (default) | TRUE = Use TLS
$ldap_tls = FALSE;
// Entry used as reference to determine the uidNumber of new users
// will be incremented automatically with each new user
// will be created if it doesn't exist
// must be contained within $ldap_base
$maxuid = "uid=maxUID";
$maxuidbase = $ldap_base;
$maxuiddn = $maxuid . "," . $maxuidbase;
// The start number for the uidNumber attribute of the first user
$maxuidstart = "1100";
// Asociative array containing Group Name => Group ID (gidNumber)
// this is used to parse the name of the group according to the
// gidNumber assigned to each LDAP DN entry
$ldap_gid = array("people" => "100", "admin" => "200");
// The default group assigned to new users
$ldap_default_group = "people";

?>
