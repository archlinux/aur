# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=gitbackup
pkgver=0.1.2
pkgrel=1
pkgdesc="Mirror git repositories"
arch=('any')
url="https://github.com/sciunto-org/gitbackup"
license=('GPL3')
depends=('python' 'git')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/g/gitbackup/${pkgname}-${pkgver}.tar.gz)
sha256sums=('37e1572e094d55009517d3f2b049349728af0278930874d2f44bdf9209944232')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
