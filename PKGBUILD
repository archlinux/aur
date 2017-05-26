# Maintainer: Maikel Wever <maikelwever@gmail.com>

pkgname=pipenv
pkgver=4.1.1
pkgrel=1
pkgdesc="An experimental project that aims to bring the best of all packaging worlds to the Python world."
url="https://github.com/kennethreitz/pipenv"
license=('MIT')
conflicts=('python-pipenv')
depends=('python' 'python-pip' 'python-pew' 'python-virtualenv')

makedepends=('python-setuptools')
source=("https://github.com/kennethreitz/pipenv/archive/v${pkgver}.tar.gz")
md5sums=('c4fed239e9aa6362a818d95215ce8198')
arch=('any')

package() {
  cd "$srcdir/pipenv-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
