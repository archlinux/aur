pkgname=lunie-cli-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="Lunie CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/lunie"
license=('MIT')
conflicts=('lunie' 'lunie-bin')
source=("https://github.com/gentij/lunie/releases/download/v${pkgver}/lunie_linux_amd64.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/lunie" "${pkgdir}/usr/bin/lunie"
}
