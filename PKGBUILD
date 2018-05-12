# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=tmdbsimple
pkgname=python-$_pkgname
pkgver=2.2.0
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

sha256sums=('29184eaef39788887e4bf7751863da250cbac4655abf132b9d026c398b0d7e08')

# vim:set ts=2 sw=2 et:
