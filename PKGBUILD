# Maintainer: Achilleas Pipinellis <axilleas archlinux info>
pkgname=python2-txsocksx
_pkgname=txsocksx
pkgver=1.13.0.3
pkgrel=2
pkgdesc="SOCKS{4,4a,5} endpoints for twisted"
arch=('any')
url="https://github.com/habnabit/txsocksx"
license=('MIT')
depends=('python2' 'python2-twisted' 'python2-pyopenssl' 'python2-parsley')
conflicts=('python2-txsocksx-git')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir -O1
}

# vim:set ts=2 sw=2 et:
md5sums=('05d03a7137a11affe4bcb7c8effba220')
