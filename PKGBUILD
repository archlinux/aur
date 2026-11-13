# Maintainer: Th30 <ras-theo at monemail dot com>

pkgname=easyeffects-bundy01-presets
_origin=EasyEffects-Presets
pkgver=3.1
pkgrel=1
pkgdesc="Community Presets for Easyeffects: Bose, Music, Serie&Film, Sony and TV&Docu"
arch=('any')
url="https://github.com/Bundy01/${_origin}"
license=('MIT')
depends=(
	calf
	easyeffects
	lsp-plugins-lv2
	mda.lv2
)
source=("${_origin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a5962a7864786338ca9a313ff5523e8b6feaaf1f45aec486c808323e3d91625d')

package()
{
	cd "${_origin}-${pkgver}"
	install -dm755 "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Bose.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Music.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Serie\&Film.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Sony.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 TV\&Docu.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
