pkgname=rsclip-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Wayland clipboard manager with GTK UI and background daemon'
arch=('x86_64')
url='https://github.com/jR4dh3y/rsclip-wl'
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
sha256sums=('1b89afad1a8410f7e5e78254c19b5f06ca69ac8be2951123cf467828a906bd6e')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/rsclip-${pkgver}-x86_64/usr" "${pkgdir}/"
}
