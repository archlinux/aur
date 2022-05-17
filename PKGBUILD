# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="execute-process-linux"
pkgver=2.5
pkgrel=0
pkgdesc="advanced process execution static library"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=()
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
_libfiles=("execute-process-linux" "execute-process-linux-defs")

for _libfile in ${_libfiles[@]}
{
    source=(${source[@]} "$_srcprefix/$_libfile")
}

md5sums=('503cbd766917491444a63472d6861eed'
         '1963c2f59044568b3ecfd588b56852da')

prepare()
{
    curl -L "$_srcprefix/PKGBUILD" > PKGBUILD-git
}

package()
{
    . PKGBUILD-git && package
}