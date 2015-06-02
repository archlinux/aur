# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Stéphane Gaudreault <stephane.gaudreault@gmail.com>

pkgname=latencytop
pkgver=0.5
pkgrel=4
pkgdesc="A tool for software developers, aimed at identifying where system latency occurs."
arch=('i686' 'x86_64')
url="http://www.latencytop.org"
depends=('gtk2' 'ncurses')
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/l/latencytop/latencytop_${pkgver}.orig.tar.gz")
md5sums=('73bb3371c6ee0b0e68e25289027e865c')

build() {
  cd "$srcdir"/latencytop-${pkgver}

  make
}

package() {
  cd "$srcdir"/latencytop-${pkgver}

  install -Dm755 latencytop "$pkgdir"/usr/bin/latencytop
}
