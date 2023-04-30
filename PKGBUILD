# Maintainer: John Beard <john.j.beard@gmail.com>
pkgname=inkscape-label-guides
pkgver=1.1.1
pkgrel=1
pkgdesc="Inkscape extension to render guides and outlines for printable labels"
arch=("any")
url="https://github.com/johnbeard/inkscape-label-guides"
license=("GPLv2")
depends=("inkscape")
makedepends=("git")
source=("git+https://github.com/johnbeard/inkscape-label-guides#tag=v${pkgver}")
md5sums=('SKIP')

package() {
  extdir="$pkgdir/usr/share/inkscape/extensions/"
  mkdir -p "${extdir}"

  cd "$srcdir/$pkgname"
  make install DESTDIR="${extdir}"
}

