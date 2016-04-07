# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net
_srcname=srp
pkgname=python2-$_srcname
pkgver=1.0.5
pkgrel=1
pkgdesc='Python implementation of the Secure Remote Password protocol (SRP).'
arch=('any')
url="https://github.com/cocagne/py$_srcname"
license=('MIT')
depends=('python2')
source=("https://pypi.python.org/packages/source/s/$_srcname/$_srcname-$pkgver.tar.gz")
sha256sums=('9ba792f7ec2681b90d9ea70abeb2ffc153a11ae53aa114fcb1bb296eba6a75fe')

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
