# Maintainer: A file <a@file.a>

pkgname=afile-git
pkgver=latest
pkgrel=1
pkgdesc="Open-source file server written in a"
arch=('x86_64')
url="https://github.com/file/afile"
license=('BSD')
depends=('git' )
makedepends=('libtool') # Add libtool as a build dependency
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgbase=file-git

source=("git+https://github.com/file/afile")

prepare() {
  cd "$srcdir/file"
}

build() {
  cd "$srcdir/file"
}

package() {
  cd "$srcdir/file"
}


sha256sums=('SKIP') 
