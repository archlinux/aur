# Maintainer: Maikel Wever <maikelwever@gmail.com>

pkgname=python-pipenv
pkgver=0.2.8
pkgrel=1
pkgdesc="An experimental project that aims to bring the best of all packaging worlds to the Python world."
url="https://github.com/kennethreitz/pipenv"
license=('MIT')
depends=('python' 'python-crayons' 'python-toml' 'python-click' 'python-pip' 'python-virtualenv' 
'python-requirements-parser' 'python-delegator.py')
makedepends=('python-setuptools')
source=("https://github.com/kennethreitz/pipenv/archive/v${pkgver}.tar.gz")
md5sums=('c79da1b8453714bd9df0961debc18710')
arch=('any')

package() {
  cd "$srcdir/pipenv-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
