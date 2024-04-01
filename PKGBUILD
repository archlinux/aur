# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='kwin-scripts-kzones'
pkgver=0.7
pkgrel=1
arch=('any')
url='https://github.com/gerritdevriese/kzones'
license=('GPL-3.0-only')
depends=('kwin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gerritdevriese/kzones/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b36078d275e7e4f6e391ca9bca485c2aaaa38fb8473726cdb18ff9963897a523')

package() {
	cd "kzones-${pkgver}"

	install -d "${pkgdir}/usr/share/kwin/scripts/kzones"
	cp -r {contents,metadata.json} "${pkgdir}/usr/share/kwin/scripts/kzones"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
