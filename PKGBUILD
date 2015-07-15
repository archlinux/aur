# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=lyx-faenza-icon-style
pkgver=0.1
pkgrel=1
pkgdesc="A faenza monochromed style for LyX (it replaces default icons)"
arch=('any')
url="http://gnome-look.org/content/show.php/LYX+Faenza+icon+style?content=145906"
license=('GPL')
source=('http://gnome-look.org/CONTENT/content-files/145906-images.zip')
depends=('lyx')
md5sums=('d0d2c12b475c77f99767adb95ea149cf')
makedepends=()

build() {
  mkdir -p "$pkgdir/usr/share/lyx/images/"
   
  cp -Rf $srcdir/images/* "$pkgdir/usr/share/lyx/images/"
}

