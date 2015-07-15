# Maintainer: Johannes Lauinger <johannes@lauinger-it.de>

pkgname=kdbx-viewer
pkgver=0.0.1
pkgrel=2
pkgdesc="ncurses GUI to browse and command-line tool to dump all contents of a KeePass2 Database files (kdbx)"
arch=('x86_64')
url="https://github.com/max-weller/kdbx-viewer"
license=('GPL')
depends=('ncurses' 'libgcrypt' 'zlib' 'expat' 'stfl')
makedepends=('git')
provides=("kdbxviewer")
source=("git+https://github.com/max-weller/kdbx-viewer.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
