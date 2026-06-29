# Maintainer: Mikele <mikele@gmail.com>

pkgname=goren-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Batch file renaming in the terminal with a live preview TUI"
arch=('x86_64')
url="https://github.com/mikelexp/goren"
license=('MIT')
depends=()
source=("${url}/releases/download/v${pkgver}/goren-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('8a5cd5559b142badfdecdafa3de5ab2eae400f65913f94e07a08a741307a879a')

package() {
  cd "${srcdir}"

  install -Dm755 goren "${pkgdir}/usr/bin/goren"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
