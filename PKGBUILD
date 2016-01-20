# Maintainer: Nathan Isom <nathanisom27[at]gmail[dot]com>
# Prev maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gtkrc-reload
pkgver=0.0.1
pkgrel=1
pkgdesc="An utility to reload the gtkrc configuration for all GTK windows at runtime"
arch=(i686 x86_64)
url="http://aur.archlinux.org/packages.php?ID=44052"
license=('GPL3')
depends=('gtk2')
source=("$pkgname.c"
        "Makefile")
md5sums=('567bed7fb76255ce4b5bda47aca2a429'
         '18d7b9b80726d892d6a9bf65388a5aac')

build() {
  cd "$srcdir/"

  make
}

package() {
  cd "$srcdir/"

  make DESTDIR="$pkgdir/" install
}
