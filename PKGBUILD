pkgname="inet-comm"
pkgver=3.7
pkgrel=0
pkgdesc="ipv4 internet tcp socket c++ library"
arch=("x86_64")
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
license=('GPL')
depends=("log-console>=1.17-1")
makedepends=()
_srcprefix="https://raw.githubusercontent.com/$author/$pkgname/$branch"
source=("$_srcprefix/$pkgname")
md5sums=("520684ecb0d62c681886092e0584bf4a")

prepare()
{
    curl -L "$_srcprefix/PKGBUILD" > PKGBUILD-git
}

package()
{
    . PKGBUILD-git && package
}

