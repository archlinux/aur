# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Max Timkovich <mtimkovich@gmail.com>

pkgname=fortune-mod-portal2
_pkgname=portal2
pkgver=0.1
pkgrel=1
pkgdesc="Fortune cookies: Portal 2 (video game)"
url="http://en.wikiquote.org/wiki/Portal_2"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source="portal2"
md5sums=('865731bb737ce4a6a609f54d0fecd815')

build() {
    strfile $_pkgname $_pkgname.dat
}

package () {
  install -D -m644 $_pkgname $pkgdir/usr/share/fortune/$_pkgname
  install -D -m644 $_pkgname.dat $pkgdir/usr/share/fortune/$_pkgname.dat
}
