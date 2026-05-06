pkgname=lunie-cli-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Lunie CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/lunie"
license=('MIT')
conflicts=('lunie' 'lunie-bin')
source=("https://github.com/gentij/lunie/releases/download/v1.1.0/lunie_linux_amd64.tar.gz")
sha256sums=('50646ff6598b538ed31b41a6b0435101a9d0b0dd0bc48858b2d56c4d4e2379d6')

package() {
  install -Dm755 "${srcdir}/lunie" "${pkgdir}/usr/bin/lunie"
}
