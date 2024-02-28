. ./PKGBUILD
_pkgver=`git ls-remote https://github.com/07th-mod/ponscripter-fork|sed '$!d;s,.*/,,'`
sed -i /^pkgver=/s/=.*/=${_pkgver/v}/`[ $pkgver = ${_pkgver/v} ] || echo \;/^pkgrel=/s/=.*/=1/` PKGBUILD
