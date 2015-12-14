# Maintainer: Michael Gisbers <arch@mylinuxtime.de>
# Contributor: hcjl <hcjlnx {at} gmail {dot} com>

pkgname=usenext
pkgver=5.62
pkgrel=2
pkgdesc="UseNeXT Client for Linux"
url="http://www.usenext.de"
license=('unknown')
depends=('mono' 'unrar' 'gtk-sharp-2')
makedepends=('rpmextract' 'sed')
arch=('any')
source=("${pkgname}-${pkgver}.rpm::http://update.tangysoft.net/download/usenext.rpm")
md5sums=('a1f5f27dbcc6f1d076703b043eab64fe')

package() {
    cd "${srcdir}"
    rpmextract.sh "${pkgname}-${pkgver}.rpm"
    cp -a "${srcdir}/usr/" "${pkgdir}/usr"
    #sed -i 's/UseNeXTLauncher/UseNeXT/g' "${pkgdir}/usr/bin/usenext"
    #rm ${pkgdir}/usr/lib/usenext/UseNeXTLauncher.exe"
}
