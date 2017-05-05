# Maintainer: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>

pkgname=python2-primefac
_pkgname=primefac
pkgrel=1
pkgver=1.1
pkgdesc='Module and command-line utility for factoring integers into primes. Formerly called pyfac.'
arch=('any')
url='https://pypi.python.org/pypi/primefac'
depends=('python2')
optdepends=('python2-gmpy2: support for multiple-precision arithmetic')
license=('MIT')
md5sums=('02d70ed033784bcbb02a132c5d966e79')
sha256sums=('5228106bbca8073189146daf3fa1b439705a3dbb707f4ca8aaea10571d27af50')

source=('https://pypi.python.org/packages/29/02/edcba0ae57d819b25873ca5bf4c8d9fb7237331524926fab3587d7eb2485/primefac-1.1.tar.gz')

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/"
}
