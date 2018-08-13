# Maintainer: liberodark

pkgname=cells
pkgver=1.0.0
pkgrel=1
pkgdesc="A Conway's Game of Life implementation."
arch=('x86_64')
url="https://github.com/FlorianFe/Cells"
license=('CC0-1')
depends=('xdg-utils')
source_x86_64=("https://github.com/FlorianFe/Cells/releases/download/v${pkgver}/Cells_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('9f9cb5f5b81ba3e2a7634f73a7b19cd7121ff48b307b599653d95341abef1ec9258f541935fa8c9c33d024d7e3175298dc387c10a9d65eef25f1dfcccefb1711'
         '5881356638e181ad3ee6c86c5049127a71e547aed8ecd0b0f955ab86913ef0f87b4403b037fef5c5abe55c59d8e668d14fb8c4cbe0004366bdef26fbbb40b7d9')
sha512sums_x86_64=('f896b2fc5f1dc9f5dc396e6b810eab04b2953031ff6edd89db30e4f0cef9484133bc2f7ada6bc10af00fee441855efeb84580da9cbf5aff483a861ef33f9eb42')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

