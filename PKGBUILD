# Maintainer: Mikele <mikele@gmail.com>

pkgname=goren-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Batch file renaming in the terminal with a live preview TUI"
arch=('x86_64')
url="https://github.com/mikelexp/goren"
license=('MIT')
depends=()
source=("${url}/releases/download/v${pkgver}/goren-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('3c030d08cbb4c6f8e8740c125c80f69b5f5479a482ec39153c4b39654f8fbe6c')

package() {
  cd "${srcdir}"

  install -Dm755 goren "${pkgdir}/usr/bin/goren"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
