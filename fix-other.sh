#!/bin/bash
root_dir=$(cd `dirname $0`/.. && pwd -P)
. /usr/share/makepkg/util/message.sh
colorize
set -e
trap 'catchError $LINENO "$BASH_COMMAND"' ERR # 捕获错误情况
catchError() {
    exit_code=$?
    if [ $exit_code -ne 0 ]; then
        error "\033[31mcommand: $2\n  at $0:$1\n  at $STEP\033[0m"
    fi
    exit $exit_code
}


res_dir="$root_dir/tmp/bili/resources"
cd "$res_dir"
asar e app.asar app

msg "解密"
"$root_dir/tools/app-decrypt.js" "$res_dir/app/main/.biliapp" "$res_dir/app/main/app.orgi.js"
"$root_dir/tools/js-decode.js" "$res_dir/app/main/app.orgi.js" "$res_dir/app/main/app.js"
"$root_dir/tools/bridge-decode.js" "$res_dir/app/main/assets/bili-bridge.js" "$res_dir/app/main/assets/bili-bridge.js"

msg2 "====index.js===="
# 修复新版不能启动的问题
msg2 "修复不能启动的问题 index.js"
cat "$root_dir/res/scripts/injectIndex.js" > "app/main/temp.js"
cat "app/main/index.js" >> "app/main/temp.js"
rm "app/main/index.js"
mv "app/main/temp.js" "app/main/index.js"
# 从app.js加载 ok
# grep -lr '!import_electron2' --exclude="app.asar" .
# sed -i 's#!import_electron2#import_electron2#' app/main/index.js
# grep -lr 'global;import_electron2' --exclude="app.asar" .
# sed -i 's#global;import_electron2#global;!import_electron2#' app/main/index.js
msg2 "====app.js===="

msg "屏蔽检测"
grep -lr 'if(!OJ' --exclude="app.asar" .
sed -i 's#if(!OJ#if(false\&\&!OJ#g' app/main/app.js
grep -lr 'if(!Tm)' --exclude="app.asar" .
sed -i 's#if(!Tm)#if(false\&\&!Tm)#' app/main/app.js
grep -lr 'if(OJ)' --exclude="app.asar" .
sed -i 's#if(OJ)#if(!OJ)#' app/main/app.js
# grep -lr ';}!uX' --exclude="app.asar" .
# sed -i 's#;}!uX#;}false\&\&!uX#' app/main/app.js

msg "路由"
grep -lr 'case"SettingsPage":return r.push({name:"Settings"});c' --exclude="app.asar" .
sed -i 's#case"SettingsPage":return r.push({name:"Settings"});c#case"SettingsPage":return r.push({name:"Settings"});default:if(a)return r.push({name:a.page});c#' app/render/assets/index.*.js

msg "添加主页菜单" # ok
grep -lr "te'](\[{'label':'设置" --exclude="app.asar" .
sed -i "s#te'](\[{'label':'设置#te'](\[{'label':'首页','click':()=>this.openMainWindowPage$.next({'page':'Root'})},{'label':'设置#" app/main/app.js

# 任务栏菜单
msg "去除标题栏"
grep -lr ']}});this\[' --exclude="app.asar" .
sed -i "s#]}});this\\[#]},frame:false});this[#g" app/main/app.js
sed -i "s#]}}),this\\[#]},frame:false}),this[#g" app/main/app.js
# splash
sed -i "s#erence']}})#erence']},frame:false})#g" app/main/app.js

msg "检查更新"
# 检查更新
grep -lr "// noinspection SuspiciousTypeOfGuard" --exclude="app.asar" .
sed -i 's#// noinspection SuspiciousTypeOfGuard#runtimeOptions.platform="win32";// noinspection SuspiciousTypeOfGuard#' app/node_modules/electron-updater/out/providerFactory.js
sed -i 's#process.resourcesPath#path.dirname(this.app.getAppPath())#' app/node_modules/electron-updater/out/ElectronAppAdapter.js

msg "====Bili Bridge===="
msg2 "inject"
cat "$root_dir/res/scripts/injectBridge.js" > "app/main/assets/temp.js"
cat "app/main/assets/bili-bridge.js" >> "app/main/assets/temp.js"
rm "app/main/assets/bili-bridge.js"
mv "app/main/assets/temp.js" "app/main/assets/bili-bridge.js"

asar p app app.asar
rm -rf app
