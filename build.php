<?php

$arr = [];
$ret = 0;

$AUR_BUILD_DIR="/srv/http/larryshell_aur";

function check($r, $m) {
    if($r) {
        die("{success:false, message:'$m'}");
    }
}
exec("cd $AUR_BUILD_DIR && make clean && make && make build", $arr, $ret);
check($ret, 'Build failed');

// --exit-code:
//  0 if no changes
//  1 if changes
exec("git -C $AUR_BUILD_DIR/larryshell diff --exit-code HEAD", $arr, $ret);
#check(1 - $ret, 'No changes');

exec("git -C $AUR_BUILD_DIR add .");
$sha = shell_exec("git -C $AUR_BUILD_DIR/larryshell rev-parse --short HEAD");
exec("git -C $AUR_BUILD_DIR commit -m 'Automatic version bump -- $sha'", $arr, $ret);

check($ret, 'Failed to commit');
// DAWT
exec("git -C $AUR_BUILD_DIR push dawt master", $arr, $ret);
check($ret, 'Failed to push to GitHub');

// AUR
exec("git -C $AUR_BUILD_DIR push origin master", $arr, $ret);
check($ret, 'Failed to push to AUR');

echo "{success:true}";
