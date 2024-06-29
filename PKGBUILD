# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='kwin-scripts-kzones'
pkgver=0.7
pkgrel=3
pkgdesc='KDE KWin Script for snapping windows into zones'
arch=('any')
url='https://github.com/gerritdevriese/kzones'
license=('GPL-3.0-only')
depends=('kwin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gerritdevriese/kzones/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('baea1b5eb4d8e50be2023c09aa684f716b3e7fd0f371a6a7f062f3c4f0f5adad')

package() {
	cd "kzones-${pkgver}"

	install -d "${pkgdir}/usr/share/kwin/scripts/kzones"
	cp -r {contents,metadata.json} "${pkgdir}/usr/share/kwin/scripts/kzones"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
