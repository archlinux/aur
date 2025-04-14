# Maintainer: erdii <me@erdii.engineering

pkgname=magic-trace-bin
pkgver=1.2.4
pkgrel=0
pkgdesc="magic-trace collects and displays high-resolution traces of what a process is doing"
arch=("x86_64")
url="https://github.com/janestreet/magic-trace"
license=("MIT")
provides=("magic-trace")
conflicts=("magic-trace")
depends=("perf" "fzf")
source=("$pkgname-$pkgver::https://github.com/janestreet/magic-trace/releases/download/v${pkgver}/magic-trace")
sha256sums=('4d50bc6fe84e8efd58649baa3e965457ab982be8b63922bf06995706db8fc49c')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/magic-trace"
}
