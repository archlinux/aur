pkgver=`curl -s https://api.github.com/repos/07th-mod/ponscripter-fork/releases/latest|grep tag_name|cut -d\" -f4`
sed -i /^pkgver=/s/=.*/=${pkgver/v}/ PKGBUILD
