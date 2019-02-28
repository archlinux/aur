# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate-dbf
pkgname=python-$_pkgname
pkgver=0.2.0
pkgrel=2
pkgdesc="Adds read support for dbf files to agate"
arch=('any')
url="http://agate-dbf.readthedocs.org/"
license=('MIT')
depends=(
    'python'
    'python-agate>=1.5.0'
    'python-dbfread>=2.0.5'
  )
makedepends=(
    'python-setuptools'
  )
source=("https://github.com/wireservice/agate-dbf/archive/${pkgver}.tar.gz")
sha256sums=('fcdb80a52f1738da7313ef7ccc6476254ae4bca9c77fe548bd478cc8b1de34c9')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}


# vim:set ts=2 sw=2 et:
