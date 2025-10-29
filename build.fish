#!/bin/fish
# 获取更新
set ver (curl 'https://hmcl.huangyuhui.net/api/update_link?channel=dev' | jq -r '.["version"]')
echo 最新版 $ver

# 获取当前版本
set pkgver (cat .SRCINFO | grep pkgver | cut -d ' ' -f 3)
echo 当前版 $pkgver

if [ $ver = $pkgver ]
    echo 已是最新版
    exit
end

# 生成 PKGBUILD
curl "http://mirrors.cloud.tencent.com/nexus/repository/maven-public/org/glavo/hmcl/hmcl-dev/$ver/hmcl-dev-$ver.jar" -O
echo pkgver=$ver >PKGBUILD
set sha (sha256sum hmcl-dev-$ver.jar | cut -d ' ' -f 1 | tr -d '\n')
echo "sha256sums=(\"$sha\"" >>PKGBUILD
cat PKGBUILD.part1 >>PKGBUILD

# build
makepkg -f
makepkg --printsrcinfo >.SRCINFO
git commit -a -m "$ver"
makepkg -i
