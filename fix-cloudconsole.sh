#!/bin/bash
echo "Fix Cloud Console"

package_dir="$srcdir/wechat_devtools/code/package.nw"
tmp_dir=$(mktemp -d)

# unpack 文件 到 路径
node "$srcdir/wxvpkg_unpack" "$package_dir/core.wxvpkg" "$tmp_dir/core.wxvpkg"


# find
open_find_result=$( grep -lr "this.props.onWindowOpenFail());" "$tmp_dir/core.wxvpkg" )
token_find_result=$( grep -lr "constructor(){this._sessionToken=\"\",this._tokenMap={}}" "$tmp_dir/core.wxvpkg" )
echo "云开发控制台启动点: $open_find_result"
echo "WebSocket token存储对象位置: $token_find_result"


# replace
new_cb_handle="this.props.onWindowOpenFail());Object.keys(window).forEach(key=>{if(!e.window[key]){try{e.window[key]=window[key];}catch(e){console.error(e);}}});"
sed -i "s/this.props.onWindowOpenFail());/$new_cb_handle/g" $open_find_result

new_constructor="constructor(){if(window.tokenData){/*有就直接用*/this._sessionToken=window.tokenData._sessionToken;this._tokenMap=window.tokenData._tokenMap;}else{/*没有就新建*/this._sessionToken=\"\",this._tokenMap={};window.tokenData=this;/*新建完要给中间人*/}}"
sed -i "s#constructor(){this._sessionToken=\"\",this._tokenMap={}}#$new_constructor#g" "$token_find_result"


# pack 路径 到 文件
node "$srcdir/wxvpkg_pack" "$tmp_dir/core.wxvpkg" "$package_dir/core.wxvpkg"
rm -rf "$tmp_dir"