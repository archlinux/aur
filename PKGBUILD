# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=parastoo-fonts
pkgver=2.0.1
pkgrel=1
pkgdesc="A beautiful Persian font based on Gandom font."
url="https://github.com/rastikerdar/parastoo-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-parastoo')
conflicts=('ttf-parastoo')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver//_/-}/parastoo-font-v${pkgver//_/-}.zip")
sha256sums=('cfa4622b7733330d898e7f228924e5952f14fb62091cf9ddebdc3633b673e43f')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{print,web}/{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}

