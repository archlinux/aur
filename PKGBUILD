# Maintainer: Scott Harrison <scott.aur@scottrix.co.uk>
#
pkgname=immichfs
pkgver=1.0.0
pkgrel=1
pkgdesc="Fuse filesystem for immich"
arch=('x86_64')
url="https://codegiant.io/scottrix/scottrix/repository/5573/files/main/README.md"
license=('MIT')
depends=('python' 'python-fusepy')
source=("git+:https://codegiant.io/scottrix/scottrix/immichfs.git#pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp src/immichfs ${DESTDIR}/usr/bin/immichfs
  chown root:root ${DESTDIR}/usr/bin/immichfs
  chmod ugo+rx ${DESTDIR}/usr/bin/immichfs
}
