# Maintainer: David Fryer <dfryer1193@gmail.com>

pkgname=sysfex-git
_pkgname=sysfex
pkgver=c8c29f7
pkgrel=1
pkgdesc="Another neofetch-like system information fetching tool for linux-based systems written in C++"
arch=('i386' 'x86_64')
url="https://github.com/mehedirm6244/sysfex"
provides=('sysfex')

source=("sysfex::git+https://github.com/mehedirm6244/sysfex.git")
sha256sums=('SKIP')
depends=('libx11')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD
}

package() {
  cd "$srcdir/$_pkgname"
  ./installer.sh
}
