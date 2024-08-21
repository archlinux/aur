# Maintainer: Th30 <ras-theo at monemail dot com>
pkgname=easyeffects-bundy01-presets
_origin=EasyEffects-Presets
pkgver=2.2
pkgrel=2
pkgdesc="Community Presets for Easyeffects: Bose, Music, Sony and Video"
arch=('any')
url="https://github.com/Bundy01/${_origin}"
license=('MIT')
depends=('easyeffects>=7.1.7' 'lsp-plugins-lv2>=1.2.17' 'mda.lv2' 'zam-plugins-lv2')
source=("${_origin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f9d875d6c22f2eeaf39449192059f3160e4d6867766306587069997c14f46419')

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
