# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=bf2c
pkgver=1.0.1
pkgrel=1
pkgdesc='Brainfuck to C compiler'
arch=('x86_64' 'i686')
url="https://gist.github.com/jdp/2237916"
license=('unknown')
depends=('python2')
source=("https://gist.githubusercontent.com/jdp/2237916/raw/470e72a046033b79ddc08c2fe25affe299b14d3d/bf2c.py")
sha256sums=('5ecb46c6a0b39fd266637c67ef9529b1595a54cdc8de5c3da64a42b566d4f997')

prepare() {
  sed 's/env python/env python2/' -i bf2c.py
}

package() {
  install -Dm755 bf2c.py "$pkgdir/usr/bin/bf2c"
}

# vim:set ts=2 sw=2 et:
