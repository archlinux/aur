# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=python-wpull
pkgver=1.2.1
pkgrel=1
pkgdesc="Wget-compatible web downloader and crawler"
arch=('any')
url="https://github.com/chfoo/wpull"
license=(GPL)
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/w/wpull/wpull-${pkgver}.tar.gz")
sha256sums=('c2491df6dd51548e598f4551032f5c8fde57006fed035832cdf9a19e732d2a9c')

package() {
  cd "${srcdir}/wpull-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
