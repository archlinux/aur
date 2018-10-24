# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=stem
pkgver=1.7.0
pkgrel=1
pkgdesc="Python controller library for Tor"
arch=('any')
url="https://stem.torproject.org/"
license=('LGPL3')
depends=('python')
makedepends=('git')
optdepends=('tor: you need a tor-server to talk to')
source=("git+https://git.torproject.org/stem.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd $srcdir/$pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}
