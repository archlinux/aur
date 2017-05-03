# Maintainer: Martin Müllenhaupt <mm+aur@netlair.de>

pkgname="xerox-c525a"
pkgver="1.0"
pkgrel="1"
pkgdesc="CUPS driver for the Fuji Xerox DocuPrint C525 A and Dell 1320C printer"
url="http://onlinesupport.fujixerox.com"
license=('custom')
arch=('i686' 'x86_64')
depends_x86_64=('lib32-libcups')
makedepends=('rpmextract')
sha256sums=('6880c76066caeb64695aa8ab025505f61f65fd03cfbd4cf72b9384c5607f953b')

source=(
  http://www.fujixeroxprinters.com/downloads/uploaded/dpc525a_linux_.0.0.tar_81c2.zip
)

package() {
  rpm2cpio "./C525A_LinuxE/Fuji_Xerox-DocuPrint_C525_A_AP-1.0-1.i386.rpm" | bsdtar -vxf - -C ${pkgdir} 
}
