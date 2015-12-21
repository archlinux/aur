# Maintainer: Aitor Pazos <mail at aitorpazos dot es> 
pkgbase=libreoffice-breeze-icons
pkgname=('libreoffice-breeze-icons')
pkgver=2015.12.21
pkgrel=1
pkgdesc="Breeze dark icons set for Libreoffice. You should select it under Tools->Options->View"
arch=('any')
url="https://github.com/NitruxSA/plasma-next-icons"
license=('LGPL')
groups=()
depends=()
makedepends=()
provides=()

source=("https://github.com/aitorpazos/archlinux-libreoffice-breeze-icons/releases/download/${pkgver}/libreoffice-breeze-icons-${pkgver}.tar.gz"
		)

md5sums=('eeaf4dc26ba6a765636eec1847ddc06b')

package() {
    LO_DIR=/usr/lib/libreoffice/share/config
    
    mkdir -p $pkgdir$LO_DIR
    cp $srcdir/images_breeze_dark.zip $pkgdir$LO_DIR/
    chmod o+r $pkgdir$LO_DIR/*.zip
}
