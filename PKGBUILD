# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=bashtuner
pkgver=v2019.04.20
pkgrel=1
pkgdesc="A guitar tuner written in bash with several tunings, and support for some other stringed instruments"
arch=('any')
url="https://gitlab.com/stormdragon2976/$pkgname"
source=("${url}/-/archive/$pkgver/${pkgname}-${pkgver}.tar.gz")
license=('unlicense')
depends=('dialog' 'sox')
provides=("$pkgname")
conflicts=("$pkgname")
sha512sums=('cbe158e8d872a93815df63fa359f8b5ea5ea3397d603e65358562a6ce5d79b038e244f2a1b8bf7276770f3707d7fe1ca439541268bdca087d20a8a9f9dd8cdb5')

package()
 {
  tar xf ${pkgname}-${pkgver}.tar.gz -C "$srcdir"
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
