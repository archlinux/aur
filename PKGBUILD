# Maintainer: Scott Harrison <scott.aur@scottrix.co.uk>
#
pkgname=immichfs
pkgver=1.0.0
pkgrel=1
pkgdesc="Fuse filesystem for immich"
arch=('x86_64')
url="https://codeberg.org/scottrix/immichfs"
license=('MIT')
depends=('python' 'python-fusepy')
source=("git+https://codeberg.org/scottrix/immichfs.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  cp src/immichfs $pkgdir/usr/bin/immichfs
  chown root:root ${pkgdir}/usr/bin/immichfs
  chmod ugo+rx ${pkgdir}/usr/bin/immichfs
}
