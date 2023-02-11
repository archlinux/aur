# Maintainer: Manos Wagner <manos.wagner@gmail.com>

pkgname=brother-mfcj430w-cups-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-J430W printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=mfcj430w_all&os=128&dlid=dlf006572_000&flang=4&type3=561"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006572/mfcj430wcupswrapper-3.0.0-1.i386.deb")
md5sums=("01f8fdb5ff7d047d947fadf17d5d4f60")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}

