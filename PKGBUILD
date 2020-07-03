# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-code-fonts
pkgver=1.1.2
pkgrel=2
pkgdesc="A beautiful monospace Persian font based on Vazir and Inconsolata fonts."
url="https://github.com/rastikerdar/vazir-code-font"
arch=(any)
license=('OFL')
provides=('ttf-vazir-code')
conflicts=('ttf-vazir-code')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazir-code-font-v${pkgver}.zip")
sha256sums=('5c10819faef1d281db03703a82d498815b3d73b83badfa3100f9bbcd893b071e')

package() {
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./Vazir-Code*.ttf
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Vazir-Code*.ttf  
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
