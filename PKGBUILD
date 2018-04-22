pkgname=bgsync
pkgver=1.4
pkgrel=1
pkgdesc='Backup and Synchronization Tool'
arch=('any')
license=('None')
source=("https://bgsoftware.de/dls/bgsync/bgsync_1.4-1_Arch.zip")
depends=('mono')
makedepends=('unzip')

sha256sums=('c2265145533bfce03762d375294c5321485b5c8dea5d594a139cf9e849512e32')

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/lib/bgsync"
	install -d "${pkgdir}/usr/lib/systemd/system"
	
	install -Dm755 "${srcdir}/usr/bin/bgsync" "${pkgdir}/usr/bin/bgsync"
	install -Dm755 "${srcdir}/usr/lib/systemd/system/bgsync.service" "${pkgdir}/usr/lib/systemd/system/bgsync.service"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsync.exe" "${pkgdir}/usr/lib/bgsync/bgsync.exe"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsync.service" "${pkgdir}/usr/lib/bgsync/bgsync.service"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsyncedit.dll" "${pkgdir}/usr/lib/bgsync/bgsyncedit.dll"
	install -Dm755 "${srcdir}/usr/lib/bgsync/BGSyncGUI.exe" "${pkgdir}/usr/lib/bgsync/BGSyncGUI.exe"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsynclib.dll" "${pkgdir}/usr/lib/bgsync/bgsynclib.dll"
	install -Dm755 "${srcdir}/usr/lib/bgsync/Helper.dll" "${pkgdir}/usr/lib/bgsync/Helper.dll"
	install -Dm755 "${srcdir}/usr/lib/bgsync/Net.dll" "${pkgdir}/usr/lib/bgsync/Net.dll"
	install -Dm755 "${srcdir}/usr/lib/bgsync/ICSharpCode.SharpZipLib.dll" "${pkgdir}/usr/lib/bgsync/ICSharpCode.SharpZipLib.dll"
}
