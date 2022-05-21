# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="xor-crypto-lib"
pkgver=1.10
pkgrel=2
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

md5sums=('1d838da8d4f47082fcc63e1427cc26da'
         '058b77d68f4400b72a864a07c323a99e')

prepare()
{
    curl -L "$_srcprefix/PKGBUILD" > PKGBUILD-git
}

package()
{
    . PKGBUILD-git && package
}