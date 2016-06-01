# Maintainer: Manish Munikar <munikarmanish@gmail.com>

pkgname=mcu8051ide
pkgver=1.4.10
pkgrel=2
pkgdesc="Graphical IDE for MCS-51 based microcontrollers"
arch=('any')
url="http://www.moravia-microsystems.com/mcu8051ide"
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
source=("${pkgname}-${pkgver}.rpm::http://www.moravia-microsystems.com/download/mcu8051ide/mcu8051ide/1.4.10/mcu8051ide-1.4-11.noarch.rpm")
md5sums=('a3b136c26d699a6c9a8c6e9e6a66d316')

package() {
    cd ${pkgdir}
    cp -r ${srcdir}/usr ${pkgdir}/usr
}
