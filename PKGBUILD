# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=stem
pkgver=1.5.2
pkgrel=1
pkgdesc="Python controller library for Tor"
arch=('i686' 'x86_64')
url="https://stem.torproject.org/"
license=('LGPL3')
depends=('python')
optdepends=('tor: you need a tor-server to talk to')
source=("git+https://git.torproject.org/stem.git#tag=1.5.2")
sha256sums=('SKIP')

package() {
  cd $srcdir/$pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}
