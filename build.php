<?php

$body = file_get_contents('php://input');
$request = json_decode($body, TRUE);
if(strcmp($_SERVER["HTTP_X_GITHUB_EVENT"], "release") != 0) {
    die("{success:false,message:'We did not receive a release request'}");
}

$good_passwd="cd73fbf67557d29398a8fef58d367d7c92c880563c86ac9b3a74537f3207949df6024501491e19603d30957135e1562426098e47d5fbdb74620c87f6b2d396dc";
$passwd=escapeshellcmd($_GET['secret']);
echo $passwd;
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

// Remove first v
$VERSION=substr($request["release"]["tag_name"],1);
$RELEASE="1";

/*
// --exit-code:
//  0 if no changes
//  1 if changes
system("bash $AUR_BUILD_DIR/fetch.sh");
system("git -C $AUR_BUILD_DIR/larryshell fetch");
system("git -C $AUR_BUILD_DIR/larryshell diff --exit-code HEAD FETCH_HEAD", $ret);
check(1 - $ret, 'No changes');
*/

system("bash $AUR_BUILD_DIR/build.sh $VERSION $RELEASE",  $ret);
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
