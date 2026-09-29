pkgname=rsclip-bin
pkgver=0.1.21
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
sha256sums=('5073c63e5dddfdf8ea2c4ba7c9a2a3eb981f00761f244c886d7f4f8619e330b0')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/rsclip-${pkgver}-x86_64/usr" "${pkgdir}/"
}
