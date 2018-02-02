# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname=('python-yarg'  'python2-yarg')
pkgver=0.1.9
pkgrel=1
pkgdesc="A semi hard Cornish cheese, also queries PyPI"
arch=('any')
url="https://github.com/kura/yarg"
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=('https://pypi.python.org/packages/d4/c8/cc640404a0981e6c14e2044fc64e43b4c1ddf69e7dddc8f2a02638ba5ae8/yarg-0.1.9.tar.gz')
md5sums=('a17cb3e82fcd86e4184ec0f8c2e013c7')

package_python-yarg() {
  depends=('python' 'python-requests')
  cd "$srcdir/yarg-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir/" --optimize=1
}
package_python2-yarg() {
  depends=('python2' 'python2-requests')
  cd "$srcdir/yarg-$pkgver"
  python2 setup.py install --prefix="/usr" --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
