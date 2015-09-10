# Maintainer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=koditools-git
provides=('koditools')
conflicts=('koditools')
replaces=('xbmctools-git')
pkgrel=1
pkgver=1.1
arch=('any')
license=('GPL2')
pkgdesc="Set of tools to interface with Kodi/XBMC"
url="http://github.com/grimpy/"
depends=('python2')
makedepends=('python2-distribute' 'git')
optdepends=('nginx: For sending media to kodi')

source=("$pkgname"::"git://github.com/grimpy/koditools.git#tag=$pkgver")
md5sums=('SKIP')

build() {
    cd
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
