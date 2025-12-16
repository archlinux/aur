pkgname=cereal-helper
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal AUR helper written in C (local build) usage: cereal [options] [pkg]"
arch=('x86_64')
url=""
license=('GNU GPLv3-or-later')
depends=('git' 'make' 'gcc')
source=('cereal-helper.c' 'README.md')
md5sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir"
  gcc cereal-helper.c -O2 -Wall -Wextra -o cereal-helper
}

package() {
  cd "$srcdir"
  install -Dm755 cereal-helper "$pkgdir/usr/bin/cereal-helper "
  install -Dm644 README.md "$pkgdir/usr/share/doc/cereal-helpe  r/README.md"
}
