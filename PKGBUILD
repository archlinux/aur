# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-code-fonts
pkgver=1.1.1
pkgrel=1
pkgdesc="A beautiful monospace Persian font based on Vazir and Inconsolata fonts."
url="https://github.com/rastikerdar/vazir-code-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir-code')
conflicts=('ttf-vazir-code')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazir-code-font-v${pkgver}.zip")
sha256sums=('fa8032f57798cceaf06de9bf10e5fbcfd194d9bde48c42f5eb44ab3ceeda015f')

package() {
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./Vazir-Code*.ttf
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
