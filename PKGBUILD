# Maintainer: erdii <me@erdii.engineering

pkgname=magic-trace-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="magic-trace collects and displays high-resolution traces of what a process is doing"
arch=("x86_64")
url="https://github.com/janestreet/magic-trace"
license=("MIT")
provides=("magic-trace")
conflicts=("magic-trace")
depends=("perf" "fzf")
source=("$pkgname-$pkgver::https://github.com/janestreet/magic-trace/releases/download/v${pkgver}/magic-trace")
sha256sums=('b3f8f28a555e5ce1ff031de94486adee5c5dcd5a3293543342f61bf45661eed2')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/magic-trace"
}
