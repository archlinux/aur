# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname="synology-drive"
pkgver="3.2.1_13271"
pkgrel="1"
pkgdesc="Drive for PC, the desktop utility of the DSM add-on package, Drive, allows you to sync and share files owned by you or shared by others between a centralized Synology NAS and multiple client computers."
arch=('x86_64')
url="https://www.synology.com"
license=('custom')
depends=('glibc' )
optdepends=('nautilus: For nautilus integration' )
conflicts=()
source=()
md5sums=()


source_x86_64=(https://global.download.synology.com/download/Utility/SynologyDriveClient/3.2.1-13271/Ubuntu/Installer/x86_64/synology-drive-client-13271.x86_64.deb)
md5sums_x86_64=('1f0ef71fac95217bc529ec3dbfc0e639')

package() {
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	ls "${pkgdir}"
	install -Dm 644 "${pkgdir}"/opt/Synology/SynologyDrive/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
