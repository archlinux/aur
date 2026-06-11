# Maintainer: Mikele <mikele@gmail.com>

pkgname=goren-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Batch file renaming in the terminal with a live preview TUI"
arch=('x86_64')
url="https://github.com/mikelexp/goren"
license=('MIT')
depends=()
source=("${url}/releases/download/v${pkgver}/goren-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('30aaa980961be311fb705103b27af2064ed4c4b25354bed8babd749581e4a541')

package() {
  cd "${srcdir}"

  install -Dm755 goren "${pkgdir}/usr/bin/goren"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
