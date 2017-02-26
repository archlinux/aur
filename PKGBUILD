# Maintainer: Cameron Matheson <cameron.matheson@gmail.com>

pkgname=brother-dcpl2540dw-lpr
pkgver=3.2.0_1
pkgrel=3
pkgdesc="Brother DCP-L2540DW lpr drivers."
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=dcpl2540dw_us_as&os=127&dlid=dlf101717_000&flang=4&type3=558"
license=('GPL2' 'custom:brother')
depends=('lib32-glibc')
#optdepends=('brother-dcp7070dw-cups: cupswrapper.')
#changelog="${pkgname}.changelog"
source=("http://download.brother.com/welcome/dlf101717/dcpl2540dwlpr-${pkgver/_/-}.i386.rpm")
md5sums=('2816da7f1cbaddc2d055a5cd6da644da')

package() {
  cp -r ${srcdir}/var ${pkgdir}/
  cp -r ${srcdir}/opt ${pkgdir}/
  cp -r ${srcdir}/etc ${pkgdir}/
}

