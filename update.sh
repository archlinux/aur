#!/bin/zsh
cd ~/Git/AUR/typora-with-plugin
local_ver=$(cat .SRCINFO | rg "pkgver" | cut -d " " -f 3)
src_old_sum=$(sha512sum .SRCINFO | cut -d " " -f 1)

local_pak_ver=$(echo $local_ver | cut -d "_" -f 1)
local_pak_sum=$(cat .SRCINFO | rg sha512sums | head -1 | cut -d " " -f 3)
local_plugin_ver=$(echo $local_ver | cut -d "_" -f 3)
local_plugin_sum=$(cat .SRCINFO | rg sha512sums | tail -1 | cut -d " " -f 3)

echo "Fetching the latest version..."
pak_url=$(curl -s https://typoraio.cn/ | rg "https://download2.typoraio.cn/linux/typora_" | cut -d "|" -f 2 | cut -d "\"" -f 28)
latest_pak_ver=$(echo $pak_url | cut  -d "_" -f 2)
latest_pak_file=typora_${latest_pak_ver}_amd.deb

latest_plugin_ver=$(curl -s https://kkgithub.com/obgnail/typora_plugin/releases | rg "h2 class=\"sr-only\"" | rg -v "Menu" | head -1 | cut -d ">" -f 2 | cut -d "<" -f 1)
plugin_url=https://gh.api.99988866.xyz/https://github.com/obgnail/typora_plugin/archive/refs/tags/${latest_plugin_ver}.tar.gz

latest_ver=${latest_pak_ver}_plugin_${latest_plugin_ver}
types=("Typora" "Typora-plugin")
local_vers=($local_pak_ver $local_plugin_ver)
latest_vers=($latest_pak_ver $latest_plugin_ver)
local_sums=($local_pak_sum $local_plugin_sum)
urls=($pak_url $plugin_url)

for i in {1..2}
do
	type=$(echo $types[$i])
	local_ver=$(echo $local_vers[$i])
	latest_ver=$(echo $latest_vers[$i])
	local_sum=$(echo $local_sums[$i])
	url=$(echo $urls[$i])
	if [[ $local_ver != $latest_ver ]];then
		echo "There is new version of " $type "  " $local_ver " --> " $latest_ver
		wget $url
		deb=$(echo $url | awk -F "/" '{print $NF}')
		latest_sum=$(sha512sum $deb)
		sed -i "s/$local_ver/$latest_ver/g" PKGBUILD
		sed -i "s/$local_sum/$latest_sum/g" PKGBUILD
		sed -i 's/pkgrel=[0-9]/pkgrel=1/g' PKGBUILD
		sed -i 's/pkgrel=[0-9]/pkgrel=1/g' PKGBUILD
		makepkg --printsrcinfo > .SRCINFO
		rm -rf $deb
	fi

done

src_new_sum=$(sha512sum .SRCINFO | cut -d " " -f 1)

if [[ $src_old_sum == $src_new_sum ]];then
	echo "There is no update for both packages"
else
	echo "Updating the packages & pushing to the server"
	#git add .
	#git commit -m "$latest_ver"
	#git push
fi

