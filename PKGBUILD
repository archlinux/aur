pkgname=rsclip-bin
pkgver=0.1.19
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
sha256sums=('7ce7396b9f740465ca0e1b2912a417c5bc148bfbde4abab995690d78815c169c')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/rsclip-${pkgver}-x86_64/usr" "${pkgdir}/"
}
