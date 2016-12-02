# Maintainer: Erik Westrup <erik.westrup@gmail.com>

pkgname=brother-dcp7070dw-lpr
pkgver=2.1.0_1
pkgrel=4
pkgdesc="Brother DCP-7070DW lpr drivers."
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadtop.aspx?c=eu_ot&lang=en&prod=dcp7070dw_eu"
license=('GPL2' 'custom:brother')
depends=('lib32-glibc')
optdepends=('brother-dcp7070dw-cups: cupswrapper.')
changelog="${pkgname}.changelog"
source=("http://www.brother.com/pub/bsc/linux/dlf/dcp7070dwlpr-${pkgver/_/-}.i386.rpm")
md5sums=('8c117577f9b48670c849d910c8386f5a')

package() {
	cp -r ${srcdir}/var ${pkgdir}/
	cp -r ${srcdir}/usr ${pkgdir}/
}
