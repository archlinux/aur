# Maintainer: Bart Verhagen <barrie.verhagen@gmail.com>
pkgname=brother-mfc-j1300dw-lpr-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="LPR driver for Brother MFC-J1300DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=mfcj1300dw_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103813/mfcj1300dwpdrv-1.0.5-0.i386.deb")
md5sums=("c260230993837cff7447e0c101bcb5a0")
depends=(lib32-glibc)

pkgver() {    
    printf "%s" $pkgver    
}

package() {
        tar -xf data.tar.gz -C "${pkgdir}"
}
