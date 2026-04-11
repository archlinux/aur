<?php
$CONFIG = array (
'datadirectory' => '/var/lib/nextcloud/data',
'logfile' => '/var/log/nextcloud/nextcloud.log',
'apps_paths' => [
  [
    'path'=> '/usr/share/webapps/nextcloud/apps',
    'url' => '/apps',
    'writable' => false,
  ],
  [
    'path'=> '/var/lib/nextcloud/apps',
    'url' => '/wapps',
    'writable' => true,
  ],
],
);
