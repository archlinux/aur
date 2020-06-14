# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=pacmods
pkgver=0.1.1
pkgrel=1
pkgdesc="Tool to show changes to system config files"
arch=('any')
url="https://github.com/c4rlo/pacmods"
license=('MIT')
depends=('python' 'python-setuptools' 'pyalpm')
options=(!emptydirs)
source=("https://github.com/c4rlo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e1396189e2a8b8075ad45f1385ca818e77c75028ea9367c77c7921f9d69430af')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
