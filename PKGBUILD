# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=gitbackup
pkgver=0.1.1
pkgrel=1
pkgdesc="Mirror git repositories"
arch=('any')
url="https://github.com/sciunto-org/gitbackup"
license=('GPL3')
depends=('python' 'git')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/g/gitbackup/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7465b5080a4a12626ed60a43820533bf04895c13e166811be93eb41c0df954b7')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
