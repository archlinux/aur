# Maintainer: Aitor Pazos <mail at aitorpazos dot es> 
pkgbase=libreoffice-breeze-icons
pkgname=('libreoffice-breeze-icons')
pkgver=2015.8.8
pkgrel=1
pkgdesc="Breeze icons set for Libreoffice. You should select it under Tools->Options->View"
arch=('any')
url="https://github.com/NitruxSA/plasma-next-icons"
license=('LGPL')
groups=()
depends=()
makedepends=()
provides=()

source=("https://github.com/aitorpazos/archlinux-libreoffice-breeze-icons/releases/download/${pkgver}/libreoffice-breeze-icons-${pkgver}.tar.gz"
		)

md5sums=('b56f74945c085897b00c531c5c770093')

package() {
    LO_DIR=/usr/lib/libreoffice/share/config
    
    mkdir -p $pkgdir$LO_DIR
    cp $srcdir/images_breeze.zip $pkgdir$LO_DIR/
    cp $srcdir/images_breeze_dark.zip $pkgdir$LO_DIR/
    chmod o+r $pkgdir$LO_DIR/*.zip
}
