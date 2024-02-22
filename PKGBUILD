# Maintainer: erdii <me@erdii.engineering

pkgname=magic-trace-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="magic-trace collects and displays high-resolution traces of what a process is doing"
arch=("x86_64")
url="https://github.com/janestreet/magic-trace"
license=("MIT")
provides=("magic-trace")
conflicts=("magic-trace")
depends=("perf" "fzf")
source=("$pkgname-$pkgver::https://github.com/janestreet/magic-trace/releases/download/v${pkgver}/magic-trace")
sha256sums=('6c1c7b1871bc2f054f701d23c32a1c6caebdf78f27fe6abe02189823e1da9502')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/magic-trace"
}
