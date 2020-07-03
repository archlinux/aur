# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=nahid-fonts
pkgver=0.3.0
pkgrel=3
pkgdesc="A Persian (Farsi) Font."
url="https://github.com/rastikerdar/nahid-font"
arch=(any)
license=('OFL')
provides=('ttf-nahid')
conflicts=('ttf-nahid')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/nahid-font-v${pkgver}.zip")
sha256sums=('98964cb08f84a4e9f56aaa08055d82f2f44489b9ba7d9cb59a403b38b9a238ab')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
