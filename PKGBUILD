# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>
pkgname=python-opticalmaterialspy
pkgver=1
pkgrel=1
pkgdesc="Python library with optical material properties."
arch=('any')
url="https://github.com/jtambasco/opticalmaterialspy"
license=('MIT')
depends=('python'
         'python-numpy'
         'python-scipy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=('git+https://github.com/jtambasco/opticalmaterialspy.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/${pkgname:7}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
