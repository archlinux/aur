# Maintainer: lautaro <tu-email>
pkgname=test
pkgver=1
pkgrel=1
pkgdesc="Kernel TKG-PDS y Headers optimizados para Silvermont. Compilado usando Clang y Thin"
arch=('x86_64')
url="https://github.com/"
license=('GPL')
depends=('coreutils' 'kmod' 'initramfs')
options=('!strip' '!debug')
source=(
  "test.txt::https://github.com/Lauta-dev/test-aur-in-actions/releases/download/test-aur-11/test.txt"
)

sha256sums=('cb895c484cc7c6d81d3eb526bbc3177d9aa2ed043b7169044452d6f472197e93')

package() {
  install -Dm644 "$srcdir/test.txt" "$pkgdir/usr/share/doc/$pkgname/test.txt"
}

