# Maintainer: Wolfgang Popp mail@wolfgang-popp.de
pkgname=ytcc
pkgver=1.0.1
pkgrel=1
pkgdesc="The YouTube channel checker"
arch=('any')
url="https://github.com/popeye123/ytcc"
license=('GPL3')
depends=('python' 'python-lxml' 'python-feedparser' 'mpv' 'youtube-dl')
makedepends=()
source=("https://github.com/popeye123/ytcc/archive/v${pkgver}.tar.gz")
md5sums=('fea0bbe110c9233d166b0675669a4847')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
