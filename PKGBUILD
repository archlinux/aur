# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=stem
pkgver=1.4.1
pkgrel=2
pkgdesc="Python controller library for Tor"
arch=('i686' 'x86_64')
url="https://stem.torproject.org/"
license=('LGPL3')
depends=('python')
optdepends=('tor: you need a tor-server to talk to')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-${pkgver}b.tar.bz2")
sha256sums=('475ba00120d571bd959d7ef24e45c4c698bb568c9321043eb7a10c1f6e554325')

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
