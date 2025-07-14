# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)infomaniak(dot)com>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)infomaniak(dot)com>
_pkgname=auxilium
pkgname=$_pkgname-git
pkgver=0.1.0
pkgrel=2
pkgdesc="Tool for parse args in many shell (bash, ksh,zsh)"
arch=(any)
url="https://auxilium.spn.109"
license=('Apache-2')
groups=()
provides=("$_pkgname")
depends=()
optdepends=()
makedepends=('git')
conflicts=("$_pkgname")
replaces=()
backup=()
install=
source=("${_pkgname}::git+https://codeberg.org/spn109/${_pkgname}.git#tag=${_pkgver}")
md5sums=('SKIP')

build()
{
    cd "$srcdir/$_pkgname"

}

package()
{
    cd "$srcdir/$_pkgname"
    mkdir -p $pkgdir/usr/bin/ 
    mkdir -p $pkgdir/usr/share/auxilium/

    cp bin/auxilium_test $pkgdir/usr/bin/
    chmod +x $pkgdir/usr/bin/auxilium_test
    cp share/* $pkgdir/usr/share/${_pkgname}/
}
