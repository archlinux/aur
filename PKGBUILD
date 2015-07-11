# Maintainer: Arnaud Bétrémieux <arno@arnoo.net>

pkgname=git-deliver
pkgver=0.15
pkgrel=1
pkgdesc="A delivery system based on Git and SSH"
arch=('i686' 'x86_64')
url="http://www.github.com/arnoo/git-deliver"
license=('GPL')
depends=('git' 'gawk' 'bash' 'openssh')
source=(https://github.com/arnoo/git-deliver/archive/$pkgver.tar.gz)
sha1sums=('3d125bba012f7d000b8a9869b691727124c5a70b')

package() {
  mkdir -p "$pkgdir/usr/lib/git-deliver"
  cp -r "$srcdir/git-deliver-$pkgver/"* "$pkgdir/usr/lib/git-deliver/"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/lib/git-deliver/deliver.sh "$pkgdir/usr/bin/git-deliver"
}


