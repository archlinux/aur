# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=bashtuner
pkgver=2018.10.31
pkgrel=1
pkgdesc="A guitar tuner written in bash with several tunings, and support for some other stringed instruments"
arch=('any')
url="https://gitlab.com/stormdragon2976/$pkgname"
source=("${url}/-/archive/$pkgver/${pkgname}-${pkgver}.tar.gz")
license=('unlicense')
depends=('dialog' 'sox')
provides=("$pkgname")
conflicts=("$pkgname")
md5sums=('0e932c9bfb02268ab5b477e0ab099b89')

package()
 {
  tar xf ${pkgname}-${pkgver}.tar.gz -C "$srcdir"
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
