# Maintainer: luelista <luelista@gmail.com>

pkgname=kdbxviewer-git
pkgver=0.2.0
pkgrel=1
pkgdesc="ncurses GUI to browse and command-line tool to dump all contents of a KeePass2 Database files (kdbx)"
arch=('x86_64')
url="https://github.com/luelista/kdbxviewer"
license=('GPL')
depends=('ncurses' 'libgcrypt' 'zlib' 'expat' 'stfl')
makedepends=('git')
provides=("kdbxviewer")
source=("git+https://github.com/luelista/kdbxviewer.git")
md5sums=('SKIP')

build() {
  cd "kdbxviewer"
  make
}

package() {
  cd "kdbxviewer"
  make DESTDIR="$pkgdir" install
}
