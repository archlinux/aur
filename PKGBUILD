# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=tmdbsimple
pkgname=python-$_pkgname
pkgver=2.5.4
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

sha256sums=('57f5db200af202d5c254304ad60b249f5d167205f4674b685c90b08385e4bc3b')
