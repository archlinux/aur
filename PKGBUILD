# Maintainer: v01d <phreakuencies@gmail.com>
pkgname=python2-catkin-tools
_pkgname=catkin_tools
pkgver=0.4.2
pkgrel=1
pkgdesc="Command line tools for working with catkin"
arch=(any)
url="https://github.com/catkin/catkin_tools"
license=('Apache')
depends=('python2' 'python2-yaml' 'python2-setuptools' 'python2-osrf-pycommon')
options=(!emptydirs)
source=(https://github.com/catkin/${_pkgname}/archive/${pkgver}.tar.gz)

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('825639c65ddb287e19573b93b72515ac')
