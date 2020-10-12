# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=tmdbsimple
pkgname=python-$_pkgname
pkgver=2.6.6
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

sha256sums=('905ec0fbf35beaece402beb119f7d062d41b9ba8c48ca9240afc964d98cffca6')
