# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Max Timkovich <mtimkovich@gmail.com>

pkgname=fortune-mod-portal
_pkgname=portal
pkgver=0.1
pkgrel=1
pkgdesc="Fortune cookies: Portal (video game)"
url="http://en.wikiquote.org/wiki/Portal_(game)"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source="portal"
md5sums=('d1272b9b001b578e56fab2dc3cc3eb2e')

build() {
    strfile $_pkgname $_pkgname.dat
}

package () {
  install -D -m644 $_pkgname $pkgdir/usr/share/fortune/$_pkgname
  install -D -m644 $_pkgname.dat $pkgdir/usr/share/fortune/$_pkgname.dat
}
