<?php

$arr = [];
$ret = 0;

$AUR_BUILD_DIR="/srv/http/larryshell_aur";

function check(r, m) {
    if($r) {
        die("{success:false, message:'$m'}");
    }
}
exec("cd $AUR_BUILD_DIR && make clean && make && make build && git add .", $arr, $ret);
check($ret, 'No changes');

sha = shell_exec("git -C $AUR_BUILD_DIR/larryshell rev-parse --short HEAD");
exec("git commit -m 'Automatic version bump -- $sha'", $arr, $ret);
check($ret, 'Failed to commit');

// DAWT
exec("git push origin master", $arr, $ret);
check($ret, 'Failed to push to GitHub');

// AUR
exec("git push aur master", $arr, $ret);
check($ret, 'Failed to push to AUR');

echo "{success:true}";
