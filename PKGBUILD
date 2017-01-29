# Maintainer: Jim Heald <james.r.heald@gmail.com>
pkgname=python-restless-git
pkgver=2.0.3
pkgrel=1
pkgdesc="A lightweight REST miniframework for Python."
arch=('any')
url="https://github.com/toastdriven/restless"
license=('BSD')
makedepends=('python-setuptools')
provides=('python-restless')
options=(!emptydirs)
source=("https://github.com/toastdriven/restless.git")
sha256sums=('SKIP')

package() {
  cd $srcdir/restless
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
