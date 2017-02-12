# Maintainer: Aitor Pazos <mail at aitorpazos dot es> 
pkgbase=libreoffice-breeze-icons
pkgname=('libreoffice-breeze-icons')
pkgver=2016.03.02
pkgrel=3
pkgdesc="Breeze dark icons set for Libreoffice. You should select it under Tools->Options->View"
arch=('any')
url="https://github.com/DarkknightAK/breeze-icon-theme"
license=('LGPL')
groups=()
depends=()
makedepends=()
provides=()
conflicts=('libreoffice-fresh>=5.3.0')

source=("https://github.com/aitorpazos/archlinux-libreoffice-breeze-icons/releases/download/${pkgver}/libreoffice-breeze-icons-${pkgver}.tar.gz"
		)

md5sums=('07d9ae27a41098001fe4759b4bd64378')

package() {
    LO_DIR=/usr/lib/libreoffice/share/config
    
    mkdir -p $pkgdir$LO_DIR
    cp $srcdir/images_breeze_dark.zip $pkgdir$LO_DIR/
    chmod o+r $pkgdir$LO_DIR/*.zip
}
