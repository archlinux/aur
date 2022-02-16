# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>
pkgname='kwin-scripts-ultrawidewindows'
pkgver=4.2
pkgrel=1
arch=('any')
url='https://github.com/lucmos/UltrawideWindows'
license=('GPL-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lucmos/UltrawideWindows/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f565d6c93edce1013127b94cb40cc14ce4fa7091b423547d920904f2303ca2c0')

package() {
	install -d "${pkgdir}/usr/share/kwin/scripts/ultrawidewindows"
	cp -r UltrawideWindows-${pkgver}/{contents,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/ultrawidewindows"
	install -Dm644 "${pkgdir}/usr/share/kwin/scripts/ultrawidewindows/metadata.desktop" "${pkgdir}/usr/share/kservices5/${pkgname}.desktop"
}
