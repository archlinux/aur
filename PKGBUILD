pkgname=bitpaint
pkgver=0.0.1
pkgrel=2
pkgdesc="Colored Bitcoin and smart contracts script"
arch=('any')
depends=('bitcoin-daemon' 'python2' 'python2-jsonrpc-git')
url="https://bitcointalk.org/index.php?topic=117630.0"
license=('AGPL')
source=(bitpaint.py)
sha256sums=('9c6c2a3886500c81407d3bef8d86c045bf3235cec3e182a0e3245c93e58de341')
provides=('bitpaint')
install=bitpaint.install

package() {
  cd "$srcdir"
  install -D -m755 bitpaint.py "${pkgdir}/usr/bin/bitpaint"
}
