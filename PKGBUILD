# Maintainer: Richard Mutze <richard.mutze@gmail.com>

pkgname=brother-dcp540cn-lpr-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="LPR driver for Brother DCP-540CN printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=de&lang=de&prod=dcp540cn_all"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf005467/dcp540cnlpr-1.0.1-1.i386.deb")
md5sums=("530ab3f94a2c25d27b4fcb96440bafa9")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
