# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>
# Contributor: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for git-bookmark upstream, git version
# Keep your bookmarks with your repository
_pkgname=git-bookmark
pkgname=$_pkgname
pkgver=0.5.1
pkgrel=1
pkgdesc="Keep your bookmarks with your repository"
arch=('any')
url="https://github.com/Qu4tro/git-bookmark"
license=('MIT')
groups=()
depends=('git' 'docopts')
makedepends=('git' 'sed' 'make')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Qu4tro/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('d16cff4a707789ce6a2a7cc22cef833a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="${pkgdir}" MANDIR="/usr/local/man" install
}
