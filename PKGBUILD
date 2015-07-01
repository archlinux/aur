# Maintainer: Mike Redd <mredd -at- zerotuezero dot com>
# Contributor: Mike Redd <mredd -at- zerotuezero dot com>

pkgname=fortune-mod-misfits
_pkgname=misfits
pkgver=1
pkgrel=2
pkgdesc="Misfits (UK) Series on E4 fortune cookie file"
url="http://dl.dropbox.com"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=($_pkgname)
md5sums=('899eaed7a52230d0dd6b733c964157ea')

build() {
  cd "$srcdir"
  strfile $_pkgname $_pkgname.dat
}

package () {
  install -D -m644 $_pkgname $pkgdir/usr/share/fortune/$_pkgname
  install -D -m644 $_pkgname.dat $pkgdir/usr/share/fortune/$_pkgname.dat
}

