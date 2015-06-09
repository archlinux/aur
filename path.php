<?php
/* -*- tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- */

/**
 * This file define the paths to where the Pluf and InDefero libraries
 * are installed. If you followed the recommended layout of the files
 * in the installation procedure, they should work out of the box.
 *
 * PLUF_PATH: path to the folder containing the Pluf.php file.
 * IDF_PATH: path to the folder containing the IDF folder.
 */
define('PLUF_PATH', '/srv/http/pluf/src');
define('IDF_PATH', dirname(__FILE__).'/../..');

set_include_path(get_include_path()
                 .PATH_SEPARATOR.PLUF_PATH
                 .PATH_SEPARATOR.IDF_PATH
                 );
