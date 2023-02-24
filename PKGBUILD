# Maintainer: erdii <me@erdii.engineering

pkgname=magic-trace-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="magic-trace collects and displays high-resolution traces of what a process is doing"
arch=("x86_64")
url="https://github.com/janestreet/magic-trace"
license=("MIT")
provides=("magic-trace")
conflicts=("magic-trace")
depends=("perf" "fzf")
source=("$pkgname-$pkgver::https://github.com/janestreet/magic-trace/releases/download/v${pkgver}/magic-trace")
sha256sums=('4dc713c85a64f5351fa67915df8b13ec48f8fdac0813fc7fc14be4f6919b3aab')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/magic-trace"
}
