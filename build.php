<?php

$body = file_get_contents('php://input');
$request = json_decode($body, TRUE);
if($request['action'] != "release") {
    die("{success:false,message:'We did not receive a release request'}");
}

$good_passwd="ef09039ff36e10fe6b7264a3b8703af3ef5fb624fd47384115ab3ae538d77ae8f9e9a7b9b39e805fa1122c14aefa414cde05e96773b90c4f2ade5b18014e6fa9";
$passwd=escapeshellcmd(trim($_SERVER['X-Hub-Signature']));
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

// --exit-code:
//  0 if no changes
//  1 if changes
system("git -C $AUR_BUILD_DIR/larryshell fetch");
system("git -C $AUR_BUILD_DIR/larryshell diff --exit-code HEAD FETCH_HEAD", $ret);
check(1 - $ret, 'No changes');

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
