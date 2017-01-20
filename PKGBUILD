# Maintainer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=koditools
provides=('koditools')
pkgrel=1
pkgver=1.2
arch=('any')
license=('GPL2')
pkgdesc="Set of tools to interface with Kodi/XBMC"
url="https://github.com/grimpy/koditools"
depends=('python2')
makedepends=('python2-distribute' 'git')
optdepends=('nginx: For sending media to kodi')

source=("https://github.com/grimpy/koditools/archive/${pkgver}.tar.gz")
md5sums=('0e9ea981b7be017c4e5ef87250725f2c')

build() {
    cd
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
