# Maintainer: David Gale <top.map4657@mailforce.link>
pkgname=otf-manufacturing-consent
pkgver=2.3
pkgrel=1
pkgdesc="An original blackletter font inspired by the New York Times masthead type developed by Fred Brennan"
arch=('any')
url="https://github.com/googlefonts/manufacturing-consent-font"
license=('OFL-1.1') 
depends=()
makedepends=()
provides=()
conflicts=()
# install=$pkgname.install
source=("manufacturing-consent-font-${pkgver}.tar.gz::https://github.com/googlefonts/manufacturing-consent-font/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('97aeb293287aa3253ce55ce2888d53580cb6119a673926597056fac86abb13c4')
package() {
  install -dm755 "${pkgdir}/usr/share/fonts/OTF"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 manufacturing-consent-font-${pkgver}/dist/Chomsky.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 manufacturing-consent-font-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
