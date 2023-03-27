# Maintainer: Victor Mingueza <victormingueza at gmail.com>
pkgname=journal-viewer-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern linux desktop application to visualize systemd logs."
arch=('x86_64')
url="https://github.com/mingue/journal-viewer"
license=('GNU General Public License v3.0')
depends=(
  'systemd'
  'webkit2gtk'
  'base-devel'
  'curl'
  'wget'
  'openssl'
  'appmenu-gtk-module'
  'gtk3'
  'libappindicator-gtk3'
  'librsvg'
  'libvips'
)
optdepends=(
)
provides=('journal-viewer')
conflicts=('journal-viewer')

source_x86_64=("https://github.com/mingue/journal-viewer/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_x86_64.tar.gz")

sha256sums_x86_64=('191b11aed1f30fe242e5170e389a1d7a3db51c73b6e83f70cae9b8ce3a28dfa8')

package() {
  _output="${srcdir}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
