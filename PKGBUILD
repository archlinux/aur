# Maintainer: Phuwit Puthipairoj <26784267+phuwit@users.noreply.github.com>
pkgname=brother-mfcj2330dw-lpr-bin
pkgver=1.0.1
pkgrel=0
pkgdesc="LPR driver for Brother MFC-J2330DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=th&lang=en&prod=mfcj2330dw_eu_as_cn"
license=("EULA")
source=("https://download.brother.com/welcome/dlf103011/mfcj2330dwlpr-$pkgver-$pkgrel.i386.deb")
sha256sums=("078b64c56701f542824ee14f9a661b75e91336d099a42197abb541b765c6d11e")
package() {
    tar -xf data.tar.gz -C "${pkgdir}"
}