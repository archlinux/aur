# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-code-fonts
pkgver=1.0.3
pkgrel=2
pkgdesc="A beautiful monospace Persian font based on Vazir and Inconsolata fonts."
url="https://github.com/rastikerdar/vazir-code-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir-code')
conflicts=('ttf-vazir-code')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazir-code-font-v${pkgver}.zip")
sha256sums=('8a0bcc3e0ab9f086aeb3d8d2827825dc5b582f34562ad4c0b6f79242a692249a')

package() {
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./Vazir-Code*.ttf
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
