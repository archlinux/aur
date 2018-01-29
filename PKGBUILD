# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=tmdbsimple
pkgname=python-$_pkgname
pkgver=2.1.0
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

sha256sums=('08c9bd522f32d8a5346e92b268d4ddabd8df187d60ef1322aaf4a584b220c276')

# vim:set ts=2 sw=2 et:
