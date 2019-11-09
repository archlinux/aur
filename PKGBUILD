# Maintainer: Zak Zajac <zak@madzak.com>

pkgname=brother-hl3170cdw-cups-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="CUPS wrapper for Brother HL-3170CDW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hl3170cdw_all"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf007058/hl3170cdwcupswrapper-1.1.4-0.i386.deb")
md5sums=("e76d71b234ca8586dd89e334bc380119")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
