# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=python-wpull
pkgver=2.0.1
pkgrel=1
pkgdesc="Wget-compatible web downloader and crawler"
arch=('any')
url="https://github.com/chfoo/wpull"
license=(GPL)
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/w/wpull/wpull-${pkgver}.tar.gz")
sha256sums=('eaaa85f9755a5ee0ac63770e37713eb68f99a73c267abd4d1439057eedd5dca3')

package() {
  cd "${srcdir}/wpull-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
