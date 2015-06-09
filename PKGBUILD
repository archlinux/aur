# Maintainer: Kirill Gagarski <gagarin.gtn at gmail dot com>
# Original authors: Jordi Cortadella, Michael Kishinevsky, Alex Kondratyev, Luciano Lavagno, Enric Pastor and Alexandre Yakovlev
pkgname=petrify
pkgver=4.2
pkgrel=3
pkgdesc="A tool for synthesis of Petri Nets and asynchronous circuits "
arch=('i686' 'x86_64')
url="http://www.lsi.upc.edu/~jordicf/petrify/distrib/home.html"
license=('custom')
optdepends=('graphviz')
provides=('petrify')
conflicts=('petrify')
source=(http://www.lsi.upc.edu/~jordicf/petrify/distrib/petrify-4.2-linux.tgz LICENSE)
package() {
  cd $srcdir
  mkdir -p "$pkgdir"/usr/{share/{licenses/petrify,doc,man/man1},bin,lib}
  cp -P petrify/bin/* "$pkgdir/usr/bin"
  cp -P petrify/lib/* "$pkgdir/usr/lib"
  cp -P petrify/doc/* "$pkgdir/usr/share/doc"
  cp -P petrify/man/man1/* "$pkgdir/usr/share/man/man1"
  cp -L LICENSE "$pkgdir/usr/share/licenses/petrify"
  chmod 755 "$pkgdir"/usr/{bin,lib}/* 
  chmod 644 "$pkgdir"/usr/share/{licenses/petrify,doc,man/man1}/*
}
md5sums=('a72708915daca998cc0b36404bec6fbd' '4b563c944fa6b67cc03d21ab3c25212e')