# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname="synology-drive"
pkgver="3.4.0_15721"
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


source_x86_64=(https://global.synologydownload.com/download/Utility/SynologyDriveClient/3.4.0-15721/Ubuntu/Installer/synology-drive-client-15721.x86_64.deb)
md5sums_x86_64=('93fbbbfef589ed88d108818e8c6ae0e8')

package() {
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	ls "${pkgdir}"
	install -Dm 644 "${pkgdir}"/opt/Synology/SynologyDrive/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
