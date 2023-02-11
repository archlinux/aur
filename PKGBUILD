# Maintainer: Manos Wagner <manos.wagner@gmail.com>

pkgname=brother-mfcj430w-lpr-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="LPR driver for Brother MFC-J430W printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=mfcj430w_all&os=128&dlid=dlf006570_000&flang=4&type3=559"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006570/mfcj430wlpr-3.0.1-1.i386.deb")
md5sums=("4bb897213f9088aaffb4c69b4df5d93c")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}

