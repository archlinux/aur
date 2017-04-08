pkgname=bgsync
pkgver=1.3.0
pkgrel=1
pkgdesc='Synchronization Tool'
arch=('any')
license=('None')
source=("https://bg-software.net/dls/bgsync_${pkgver}-${pkgrel}_Arch.zip")
depends=('mono')
makedepends=('unzip')

sha256sums=('fac563e63536295cee91086d74795755f92f7404815f02ccd8eb19a43b043b3d')

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/lib/bgsync"
	
	install -Dm755 "${srcdir}/usr/bin/bgsync" "${pkgdir}/usr/bin/bgsync"
	install -Dm755 "${srcdir}/lib/systemd/system/bgsync.service" "${pkgdir}/lib/systemd/system/bgsync.service"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsync.exe" "${pkgdir}/usr/lib/bgsync/bgsync.exe"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsync.service" "${pkgdir}/usr/lib/bgsync/bgsync.service"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsyncedit.dll" "${pkgdir}/usr/lib/bgsync/bgsyncedit.dll"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsynclib.dll" "${pkgdir}/usr/lib/bgsync/bgsynclib.dll"
	install -Dm755 "${srcdir}/usr/lib/bgsync/ICSharpCode.SharpZipLib.dll" "${pkgdir}/usr/lib/bgsync/ICSharpCode.SharpZipLib.dll"
}
