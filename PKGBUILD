# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)infomaniak(dot)com>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)infomaniak(dot)com>
_pkgname=auxilium
pkgname=$_pkgname-git
pkgver=0.0.21
pkgrel=1
pkgdesc="Tool for parse args in many shell (bash, ksh,zsh)"
arch=(any)
url="https://salsa.debian.org/openstack-team/third-party/auxilium"
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
source=("${_pkgname}::git+https://salsa.debian.org/openstack-team/third-party/${_pkgname}.git#commit=86a9d28868b5bbfd1c0556a99323d6af1b6ab732")
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
