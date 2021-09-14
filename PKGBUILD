# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>
pkgname='kwin-scripts-ultrawidewindows'
pkgver=4.1
pkgrel=1
arch=('any')
url='https://github.com/lucmos/UltrawideWindows'
license=('GPL-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lucmos/UltrawideWindows/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('59dbd042a29f207053ad0bbc9e11f068654af93bb517000e452fb29840b02dcc')

package() {
	install -d "${pkgdir}/usr/share/kwin/scripts/ultrawidewindows"
	cp -r UltrawideWindows-${pkgver}/{contents,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/ultrawidewindows"
	install -Dm644 "${pkgdir}/usr/share/kwin/scripts/ultrawidewindows/metadata.desktop" "${pkgdir}/usr/share/kservices5/${pkgname}.desktop"
}
