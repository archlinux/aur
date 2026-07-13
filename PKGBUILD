pkgname=rsclip-bin
pkgver=0.1.13
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
sha256sums=('cadfe8ee677ece6f4f267e17e9dc06a0c655330433b88f51fa34421056c9f34a')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/rsclip-${pkgver}-x86_64/usr" "${pkgdir}/"
}
