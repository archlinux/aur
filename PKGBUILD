# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=tmdbsimple
pkgname=python-$_pkgname
pkgver=2.2.9
pkgrel=1
pkgdesc="A wrapper for The Movie Database API v3. "
arch=('any')
url="https://github.com/celiao/tmdbsimple"
license=('GPLv3')
depends=('python'
         'python-requests')

source=("https://github.com/celiao/tmdbsimple/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('aaca46cd08324a24750d01efbe11a87ac3fab008b2bc3c21a1f6530339b4e859')

# vim:set ts=2 sw=2 et:
