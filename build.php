<?php

$body = file_get_contents('php://input');
$request = json_decode($body, TRUE);
if(strcmp($_SERVER["HTTP_X_GITHUB_EVENT"], "release") != 0) {
    die("{success:false,message:'We did not receive a release request'}");
}

$good_passwd="90b145e66e20ce106bd4a65e36353e78e8196162338ac941d4af522c503a23225b112c8e7ca371a1b23634435cb8bdf583963d5e0d085267b6cdb09c6105ca64";
$passwd=escapeshellcmd($_SERVER['HTTP_X_HUB_SIGNATURE']);
$hashed_passwd=shell_exec("printf $passwd | sha512sum | cut -d ' ' -f 1");
$cmp = strcmp(trim($hashed_passwd), trim($good_passwd));
if($cmp != 0) {
    die("{success:false, message:'Password incorrect', password: '$passwd', hashed_password: '$hashed_passwd'}");
}

function check($r, $m) {
    if($r) {
        die("{success:false, message:'$m'}");
    }
}

$AUR_BUILD_DIR="/srv/http/larryshell_aur";

// --exit-code:
//  0 if no changes
//  1 if changes
system("git -C $AUR_BUILD_DIR/larryshell fetch");
system("git -C $AUR_BUILD_DIR/larryshell diff --exit-code HEAD FETCH_HEAD", $ret);
// check(1 - $ret, 'No changes');

system("bash $AUR_BUILD_DIR/build.sh",  $ret);
check($ret, 'Build failed');

system("git -C $AUR_BUILD_DIR add .");
$sha = system("git -C $AUR_BUILD_DIR/larryshell rev-parse --short HEAD");
system("git -C $AUR_BUILD_DIR commit -m 'Automatic version bump -- $sha'", $ret);
check($ret, 'Failed to commit');

// DAWT
system("git -C $AUR_BUILD_DIR push dawt master", $ret);
check($ret, 'Failed to push to GitHub');

// AUR
system("git -C $AUR_BUILD_DIR push origin master", $ret);
check($ret, 'Failed to push to AUR');

echo "{success:true}";
