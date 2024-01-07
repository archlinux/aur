# Maintainer: erdii <me@erdii.engineering

pkgname=magic-trace-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="magic-trace collects and displays high-resolution traces of what a process is doing"
arch=("x86_64")
url="https://github.com/janestreet/magic-trace"
license=("MIT")
provides=("magic-trace")
conflicts=("magic-trace")
depends=("perf" "fzf")
source=("$pkgname-$pkgver::https://github.com/janestreet/magic-trace/releases/download/v${pkgver}/magic-trace")
sha256sums=('63374a9187cf8d0c0cd86cd79db9152a27a0bf7a862d40e9e74701accdaf94e3')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/magic-trace"
}
