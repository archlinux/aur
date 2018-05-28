#Maintainer: Boris Geiger <boris.geiger@bgsoftware.de>
pkgname=bgsync
pkgver=1.4.1
pkgrel=1
pkgdesc='Backup and Synchronization Tool'
arch=('any')
url="https://bgsoftware.de"
license=('None')
source=("https://bgsoftware.de/dls/bgsync/1.4.1/bgsync_1.4.1-1_Arch.zip")
depends=('mono')
makedepends=('unzip')

sha256sums=('63a9d2e13432e7086f7eff3ccc0574b6a3b83b7d0e0553ddccbc196797a41c81')

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
