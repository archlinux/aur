<?php
$files = `pacman -Qql drupal | egrep '(bootstrap|iso).inc'`;
foreach (preg_split ("/\s+/", $files) as $file)
    if (!empty($file))
        require $file;

echo '( ';
foreach (_locale_get_predefined_list() as $key => $names) {
    echo "[$key]=\"$names[0]\" ";
}
echo ')';
