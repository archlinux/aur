#!/bin/fish
# 获取更新
set ver (curl 'https://hmcl.huangyuhui.net/api/update_link?channel=dev' | jq -r '.["version"]')
echo 最新版 $ver

# 获取当前版本
set pkgver (cat .SRCINFO | grep pkgver | cut -d ' ' -f 3)
set pkgrel (cat .SRCINFO | grep pkgrel | cut -d ' ' -f 3)
echo 当前版 $pkgver.$pkgrel

if [ $ver = $pkgver.$pkgrel ]
    echo 已是最新版
    exit
end

# 生成 PKGBUILD
set vers (string split . $ver)
set pkgver $vers[1].$vers[2].$vers[3]
set pkgrel $vers[4]
curl "http://mirrors.cloud.tencent.com/nexus/repository/maven-public/org/glavo/hmcl/hmcl-dev/$ver/hmcl-dev-$ver.jar" -O
echo pkgver=$pkgver >PKGBUILD
echo pkgrel=$pkgrel >>PKGBUILD
set sha (sha256sum hmcl-dev-$pkgver.$pkgrel.jar | cut -d ' ' -f 1 | tr -d '\n')
echo "sha256sums=(\"$sha\"" >>PKGBUILD
cat PKGBUILD.part1 >>PKGBUILD

# build
makepkg -f
makepkg --printsrcinfo >.SRCINFO
makepkg -i
