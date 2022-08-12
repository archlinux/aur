# Maintainer: Helhet <hhdev@proton.me>

pkgname=brother-hl5250dn-lpr-bin
pkgver=2.0.1_1
pkgrel=1
pkgdesc="LPR printer driver for Brother HL-5250DN"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hl5250dn_all"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf005984/brhl5250dnlpr-2.0.1-1.i386.deb")
md5sums=("acd146a5198f58b8e404d529ae4abe61")
optdepends=('psutils: PostScript utilities')

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
