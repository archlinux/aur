# Maintainer: dront78

_pkgname=gols
pkgname=gols-git
pkgver=1.0.0
pkgrel=2
pkgdesc='Tool to syncronize Garmin devices with online service'
url='https://gols.readthedocs.io/'
license=('BSD')
source=('git+https://github.com/euri10/gols.git')
sha256sums=('SKIP')
arch=('any')
depends=('python' 'python-click' 'python-pytest' 'python-testfixtures')
conflicts=('gols')
provides=('gols')

package() {
  cd ${srcdir}/gols
  python setup.py install --root="$pkgdir/" --optimize=1
  cd ../..
}

# vim: ft=sh ts=2 sw=2 et

