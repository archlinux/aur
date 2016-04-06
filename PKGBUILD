# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=python-wpull
pkgver=1.2.3
pkgrel=1
pkgdesc="Wget-compatible web downloader and crawler"
arch=('any')
url="https://github.com/chfoo/wpull"
license=(GPL)
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/w/wpull/wpull-${pkgver}.tar.gz")
sha256sums=('93058d8b1864c80a160a94715a471795ea13f4527e2c7713f231a6dbad73d5fe')

package() {
  cd "${srcdir}/wpull-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
