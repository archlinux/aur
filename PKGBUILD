# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: bender02 at archlinux dot us
pkgname=fortune-mod-futurama
pkgver=0.2
pkgrel=4
pkgdesc="Futurama fortune cookie files"
url="http://www.netmeister.org/misc.html"
depends=('fortune-mod')
groups=('fortune-mods')
arch=('any')
license=('unknown')
source=(http://www.netmeister.org/apps/$pkgname-$pkgver.tar.gz)
md5sums=('fa6f3c782180967469850dfd785f81aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  strfile futurama futurama.dat
}

package() {
  install -d "$pkgdir/usr/share/fortune"
  install -m 644 "$srcdir/$pkgname-$pkgver/"futurama* "$pkgdir/usr/share/fortune"
}
