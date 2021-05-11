# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

_pkgname=crystalline
pkgname=crystalline-bin
pkgver=0.3.0
pkgrel=0
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
depends=("gc" "libevent" "pcre" "libyaml" "llvm10-libs")
source=("$_pkgname.gz::https://github.com/elbywan/crystalline/releases/download/v${pkgver}/crystalline_x86_64-unknown-linux-gnu.gz")
provides=(crystalline)
conflicts=(crystalline)

package() {
  cd "$srcdir"
  install -D -m 0755 crystalline ${pkgdir}/usr/bin/crystalline
}

sha512sums=('a975fb2d25bb80b761e00496e0d576521f3027d97d9d9f4a2e3b8bf1494ae1e635e76069813b9850c315fb183d7dfa2503f4378a747e9f1d5960742141519960')
