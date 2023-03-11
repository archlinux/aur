# Maintainer: Oran RH <oranroha@gmail.com>

pkgname="pipes.js-git"
license=('DBAD V1.1')
pkgver=1.0.0
pkgrel=1.0
pkgdesc="Rewrite of pipes.sh in nodejs. Faster, more config options, and overall better."
arch=('x86_64')
url=https://github.com/Oman395/pipes.js
depends=('nodejs>=16.0.0')
source=('https://github.com/Oman395/pipes.js/archive/refs/heads/master.zip')
sha256sums=('99693a3532b8471526eb543fe964faf915b5fa6ceb2042ee6614a5c17311767c')

prepare() {
  unzip $srcdir/master.zip
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/pipes.js-master/pipes.js" "$pkgdir/usr/bin"
}
