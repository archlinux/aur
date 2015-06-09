# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=stem
pkgver=1.4.1
pkgrel=1
pkgdesc="Python controller library for Tor"
arch=('i686' 'x86_64')
url="https://stem.torproject.org/"
license=('LGPL3')
makedepends=('git')
optdepends=('tor: you need a tor-server to talk to')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('e8196b16584796b2817613ca6ba3cbe4')

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
