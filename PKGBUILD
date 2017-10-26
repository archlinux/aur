# Maintainer: Richard Mathot <rim@odoo.com>
pkgname=brother-dcpl2560dw-lpr
pkgver=3.2.0_1
pkgrel=1
pkgdesc="Brother DCP-L2560DW lpr drivers."
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadend.aspx?c=gb&lang=en&prod=dcpl2560dw_eu&os=127&dlid=dlf101765_000&flang=4&type3=558"
license=('GPL2' 'custom:brother')
depends=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf101765/dcpl2560dwlpr-${pkgver/_/-}.i386.rpm")
md5sums=('673e79e2b59a45e12c60e6ab4406c486')
package() {
  cp -r ${srcdir}/var ${pkgdir}/
  cp -r ${srcdir}/opt ${pkgdir}/
  cp -r ${srcdir}/etc ${pkgdir}/
}

