# Maintainer: Th30 <ras-theo at monemail dot com>

pkgname=easyeffects-bundy01-presets
_origin=EasyEffects-Presets
pkgver=2.3
pkgrel=1
pkgdesc="Community Presets for Easyeffects: Bose, Music, Sony and Video"
arch=('any')
url="https://github.com/Bundy01/${_origin}"
license=('MIT')
depends=(
	easyeffects
	lsp-plugins-lv2
	mda.lv2
	zam-plugins-lv2
)
source=("${_origin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d1b6dc793b7d020660924fc1d1f71e3aebb275330221093008495563ba42b941')

package()
{
	cd "${_origin}-${pkgver}"
	install -dm755 "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Bose.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Music.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Sony.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Video.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
