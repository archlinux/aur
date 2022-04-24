pkgname="inet-comm"
pkgver=3.7
pkgrel=1
pkgdesc="ipv4 internet tcp socket c++ library"
arch=("x86_64")
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
license=('GPL3')
depends=("log-console>=1.18-1")
_srcprefix="https://raw.githubusercontent.com/$author/$pkgname/$branch"
source=("$_srcprefix/$pkgname")
md5sums=("1015ed26e90ac5704b8ec022a371fbcd")

prepare()
{
    curl -L "$_srcprefix/PKGBUILD" > PKGBUILD-git
}

package()
{
    . PKGBUILD-git && package
}

