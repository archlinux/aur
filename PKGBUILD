# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="xor-crypto-lib"
pkgver=1.9
pkgrel=0
pkgdesc="xor encryption c++ library"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=("log-console>=1.18-1")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

_srcprefix="https://raw.githubusercontent.com/$author/$pkgname/$branch"
_libfiles=("xor-crypt" "xor-crypt-defs")

for _libfile in ${_libfiles[@]}
{
    source=(${source[@]} "$_srcprefix/$_libfile")
}

md5sums=('08be27c92138a391361a5bfabe998c06'
         '058b77d68f4400b72a864a07c323a99e')

prepare()
{
    curl -L "$_srcprefix/PKGBUILD" > PKGBUILD-git
}

package()
{
    . PKGBUILD-git && package
}