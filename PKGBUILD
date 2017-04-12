pkgname=bgsync
pkgver=1.3.1
pkgrel=1
pkgdesc='Synchronization Tool'
arch=('any')
license=('None')
source=("https://bg-software.net/dls/bgsync_${pkgver}-${pkgrel}_Arch.zip")
depends=('mono')
makedepends=('unzip')

sha256sums=('1e36c74b37d96c6f068783bc4074413e3b8a96e58768981917d2c46d60254652')

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/lib/bgsync"
	install -d "${pkgdir}/usr/lib/systemd/system"
	
	install -Dm755 "${srcdir}/usr/bin/bgsync" "${pkgdir}/usr/bin/bgsync"
	install -Dm755 "${srcdir}/usr/lib/systemd/system/bgsync.service" "${pkgdir}/usr/lib/systemd/system/bgsync.service"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsync.exe" "${pkgdir}/usr/lib/bgsync/bgsync.exe"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsync.service" "${pkgdir}/usr/lib/bgsync/bgsync.service"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsyncedit.dll" "${pkgdir}/usr/lib/bgsync/bgsyncedit.dll"
	install -Dm755 "${srcdir}/usr/lib/bgsync/bgsynclib.dll" "${pkgdir}/usr/lib/bgsync/bgsynclib.dll"
	install -Dm755 "${srcdir}/usr/lib/bgsync/ICSharpCode.SharpZipLib.dll" "${pkgdir}/usr/lib/bgsync/ICSharpCode.SharpZipLib.dll"
}
