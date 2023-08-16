# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=bashtuner
pkgver=2019.04.20
pkgrel=1
pkgdesc="A guitar tuner written in bash with several tunings, and support for some other stringed instruments"
arch=('any')
url="https://git.stormux.org/storm/$pkgname"
source=("${url}/-/archive/$pkgver/${pkgname}-${pkgver}.tar.gz")
license=('unlicense')
depends=('dialog' 'sox')
provides=("$pkgname")
conflicts=("$pkgname")
sha512sums=('6df491fdfb30552d85a931f2f3ccba2160786ce3bd08a87fa13baed0c0b98ce2efd1dab776b0517ebd1907f7de0a2681ff1f54c63a6ad022a4908fc9d9cc300f')

package()
 {
  tar xf ${pkgname}-${pkgver}.tar.gz -C "$srcdir"
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
