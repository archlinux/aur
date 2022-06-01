pkgname="inet-comm"
pkgver=3.10
pkgrel=0
pkgdesc="ipv4 internet tcp socket c++ library"
arch=("x86_64")
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
license=('GPL3')
depends=("log-console>=1.18-1")
_srcprefix="https://raw.githubusercontent.com/$author/$pkgname/$branch"
source=("$_srcprefix/$pkgname")
md5sums=("23f4d20ec8ff267681bcdbfbd9571072")

prepare()
{
    curl -L "$_srcprefix/PKGBUILD" > PKGBUILD-git
}

package()
{
    . PKGBUILD-git && package
}

