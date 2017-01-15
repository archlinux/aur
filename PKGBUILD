# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname="pympv"
pkgname=python-pympv
pkgver=0.4.1
pkgrel=1
pkgdesc="A python wrapper for libmpv."
arch=('i686' 'x86_64')
url="https://github.com/marcan/pympv"
license=('gpl')
depends=('python' 'mpv')
makedepends=('cython')
source=("https://pypi.python.org/packages/d9/5e/0e4686a06dc6976416bc2728b727b6150ab044645542bfbcbdda0994e865/$_realname-$pkgver.tar.gz")
md5sums=('6aea4b340bf300013bb95e0802d252d0')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
