# Maintainer: Wolfgang Popp mail@wolfgang-popp.de
pkgname=ytcc
pkgver=1.0.0
pkgrel=1
pkgdesc="The YouTube channel checker"
arch=('any')
url="https://github.com/popeye123/ytcc"
license=('GPL3')
depends=('python' 'python-lxml' 'python-feedparser' 'mpv' 'youtube-dl')
makedepends=()
source=(https://github.com/popeye123/ytcc/archive/v1.0.0.tar.gz)
md5sums=('e0c6d220844564486b830ea51bfe126f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
