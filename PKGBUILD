# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-nose2' 'python2-nose2')
_pkgbase='nose2'
pkgver=0.5.0
pkgrel=1
pkgdesc="The next generation of nicer testing for python"
arch=(any)
url="https://github.com/nose-devs/nose2"
license=('BSD')
options=(!emptydirs)
install=
source=("https://github.com/nose-devs/nose2/archive/${pkgver}.tar.gz")
sha256sums=('b81afc72e91c0f2bf26ec2418caac3cabc9e1379451c255cd733d686bc627db5')

package_python-nose2() {
depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-nose2() {
depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
