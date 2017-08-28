# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Contributor: unlucu <unlucu at gmail dot com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/git-annex-bin

pkgname=aspell-tr
pkgver=0.50
pkgrel=2
pkgdesc="Turkish dictionary for aspell"
arch=('any')
url="http://turkce.sourceforge.net/"
license=('GPL')
depends=('aspell')
source=('ftp://ftp.gnu.org/gnu/aspell/dict/tr/aspell-tr-0.50-0.tar.bz2')
sha256sums=('0bc6530e5eebf8b2b53f1e8add596c62099173f62b9baa6b3efaa86752bdfb4a')

package () {
  cd $startdir/src/aspell-tr-${pkgver}-0
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
