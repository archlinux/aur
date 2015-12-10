# Maintainer: Darshit Shah <darnir@gmail.com>
pkgname=vgrep
pkgver=15.11
pkgrel=1
pkgdesc="Reimpementation of the ancient cgvg perl scripts"
arch=('any')
url="https://github.com/vrothberg/vgrep"
license=('GPLv3')
depends=('python2')
source=("https://github.com/vrothberg/${pkgname}/archive/${pkgver}.tar.gz")

build() {
true
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -t "${pkgdir}/usr/bin/" vgrep
}

# vim: ts=2:sw=2:et
md5sums=('2a7d645d3173e308f6f45e71ca89e9b7')
