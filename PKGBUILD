pkgname=lunie-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Lunie CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/lunie"
license=('MIT')
conflicts=('lunie' 'lunie-bin')
source=("https://github.com/gentij/lunie/releases/download/v1.0.0/lunie_linux_amd64.tar.gz")
sha256sums=('d911d7d6d7ffc4415be97c8fa279102c8302bf291212274d8e7e86d3c1df0e90')

package() {
  install -Dm755 "${srcdir}/lunie" "${pkgdir}/usr/bin/lunie"
}
