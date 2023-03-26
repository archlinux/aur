# Maintainer: Victor Mingueza <victormingueza at gmail.com>
pkgname=journal-viewer-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern linux desktop application to visualize systemd logs."
arch=('x86_64')
url="https://github.com/mingue/journal-viewer"
license=('GNU General Public License v3.0')
depends=(
  'systemd'
)
optdepends=(
)
provides=('journal-viewer')
conflicts=('journal-viewer')

source_x86_64=("https://github.com/mingue/journal-viewer/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_x86_64.tar.gz")

sha256sums_x86_64=('9ad1430af3bb2d7730c63cfbce69c1c1a7daf091b93a93a49d7b4c8e8503420e')

package() {
  _output="${srcdir}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
