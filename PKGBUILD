# Maintainer: Filip Hodun <filiphodun@gmail.com>

pkgname=brother-mfcl2732dw
pkgver=4.0.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-L2732DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=mfcl2732dw_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103528/mfcl2730dwpdrv-4.0.0-1.i386.deb")
sha256sums=('fe10170560c4c44471c368a6129ddd61138921004b7abd0b3633e26b2a8a71d6')

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
