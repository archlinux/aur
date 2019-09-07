# Maintainer: Jake <aur@ja-ke.tech>

pkgname=python2-svg.path
pkgver=3.0
pkgrel=1
pkgdesc="SVG path objects and parser"
arch=('any')
url="https://github.com/regebro/svg.path"
license=('CCPL')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/5a/7f/7a601000fc400024f76e660569b0b97f98787279daff079f0dbfa89293ba/svg.path-${pkgver}.tar.gz)
md5sums=('13c080a8ce70cc6445c40e7191cf281d')

package() {
  cd "${srcdir}/svg.path-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
