# Maintainer: Oran RH <oranroha@gmail.com>

pkgname="pipes.js-git"
license=('DBAD V1.1')
pkgver=1.0.1
pkgrel=1.0
pkgdesc="Rewrite of pipes.sh in nodejs. Faster, more config options, and overall better."
arch=('x86_64')
url=https://github.com/Oman395/pipes.js
depends=('nodejs>=16.0.0')
source=('https://github.com/Oman395/pipes.js/archive/refs/heads/master.zip')
sha256sums=('96f371536ae83c7cf2a71b9acb363cbed00cb82bd8dec68470bd8d9f59aee270')

prepare() {
  unzip $srcdir/master.zip
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/pipes.js-master/pipes.js" "$pkgdir/usr/bin"
}
