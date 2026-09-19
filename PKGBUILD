pkgname=rsclip-bin
pkgver=0.1.18
pkgrel=1
pkgdesc='Wayland clipboard manager with GTK UI and background daemon'
arch=('x86_64')
url='https://github.com/jR4dh3y/rsclip'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'gtksourceview5'
)
optdepends=(
  'tesseract: OCR support'
  'wl-clipboard: wl-copy and wl-paste integration'
  'wtype: auto-paste into the focused window'
)
provides=('rsclip')
conflicts=('rsclip')
source=(
  "${pkgname}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/rsclip-${pkgver}-x86_64.tar.zst"
)
sha256sums=('c8cedc23a5edbfd91ab6a67697681bbcb90dc0246260392a9a090fdc42405f6f')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/rsclip-${pkgver}-x86_64/usr" "${pkgdir}/"
}
