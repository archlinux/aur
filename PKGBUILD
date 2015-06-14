# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=steinberg-asio
pkgver=2.3
pkgrel=6

pkgdesc="Steinberg's ASIO SDK"
url="http://www.steinberg.net/en/company/developer.html"
arch=('any')
license=('custom')

source=("http://www.steinberg.net/sdk_downloads/asiosdk${pkgver}.zip")
sha256sums=('69225020e9144af568784c6076b55939a55369edaf0ffcdf4d5e5b5898f31b9b')

package() {
  cd ASIOSDK2.3
  install -d -m755 -p "$pkgdir"/usr/share/licenses/"$pkgname"
  install -m644 Steinberg\ ASIO\ Licensing\ Agreement.pdf "$pkgdir"/usr/share/licenses/"$pkgname"
  install -D -m644 common/asio.h "$pkgdir"/usr/include/"$pkgname"/asio.h
}
# vim:set ts=2 sw=2 et:
