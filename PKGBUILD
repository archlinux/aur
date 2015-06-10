# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

pkgname=cjdscript
pkgver=10.2
pkgrel=1
epoch=1
pkgdesc='Script to deploy and run the collection of working tools included with cjdns'
url='https://github.com/prurigro/cjdscript'
license=('GPL3')
arch=('any')
depends=('git' 'python2' 'nodejs' 'wget')
optdepends=('cmake: Required for the PySide python2 library'
            'qt4: Required for the PySide python2 library'
            'pygtk: Required for the matplotlib python2 library')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('4fc821fd95f29da249ec185b022d6e704b7e16e04f1eebe3b8229626ab849a20b55dde150ec71a2075d28401fc44495ede1f1ecdf9732c396a94598b6618f802')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
