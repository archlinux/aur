# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>
pkgname='kwin-scripts-ultrawidewindows'
pkgver=5.0
pkgrel=2
arch=('any')
url='https://github.com/lucmos/UltrawideWindows'
license=('GPL-2.0-only')
depends=('kwin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lucmos/UltrawideWindows/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8bad79f455aec94755dcb3715f641fbaca707f74d36f05e78d65a16be1d1ec8c')

package() {
	cd "UltrawideWindows-${pkgver}"

	install -d "${pkgdir}/usr/share/kwin/scripts/ultrawidewindows"
	cp -r {contents,metadata.json} "${pkgdir}/usr/share/kwin/scripts/ultrawidewindows"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
