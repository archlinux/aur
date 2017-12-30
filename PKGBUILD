# Maintainer: Red-Code 
# Maintainer: Manish Munikar <munikarmanish@gmail.com>

pkgname=mcu8051ide
pkgver=1.4.10
pkgrel=3
pkgdesc="Graphical IDE for MCS-51 based microcontrollers"
arch=('any')
url="https://sourceforge.net/projects/mcu8051ide/"
license=('GPLv3')
depends=('tcl>=8.5.9'
         'tk>=8.5.9'
         'tcllib>=1.6'
         'bwidget>=1.8'
         'itcl3>=3.4'
         'tdom>=0.8'
         'tkimg>=1.3'
         'tclx>=8.4')
optdepends=('cmake: cross-platform make system'
            'rxvt-unicode: for unicode support'
            'vim: for text-editing'
            'emacs: for text-editing'
            'nano: for text-editing'
            'le: for text-editing'
            'hunspell: for spell-checking')
source=("${pkgname}-${pkgver}.rpm::https://sourceforge.net/projects/mcu8051ide/files/mcu8051ide/1.4.9/mcu8051ide-1.4-10.noarch.rpm/download")
md5sums=('7c3fc2a212e0fe203856bbe27566d3bf')

package() {
    cd ${pkgdir}
    cp -r ${srcdir}/usr ${pkgdir}/usr
}
