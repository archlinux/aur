# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="thunar-sendto-clamtk"
pkgver="0.0.6"
pkgrel="2"
pkgdesc="A simple plugin to allow a right-click, context menu scan of files or folders in Thunar."
arch=('any')
url="https://github.com/dave-theunsub/thunar-sendto-clamtk"
license=('GPL' 'custom:Artistic License')
depends=('clamtk' 'thunar')
provides=("${pkgname}")

source=("https://raw.githubusercontent.com/dave-theunsub/${pkgname}/master/${pkgname}.desktop"
		"https://raw.githubusercontent.com/dave-theunsub/thunar-sendto-clamtk/master/LICENSE"
)
sha256sums=('28222ac0dd60cbeb0ea0f3b0ac4501cfaefa3a9823babfce0beac5016ce2b9ac'
            '7617f2fe90d16082e149903265c74de3e2a0c7f810347e8085a2f3d2cd9c7708')

package() {
	cd ${srcdir}
	install -m 644 -D ${pkgname}.desktop "${pkgdir}/usr/share/Thunar/sendto/${pkgname}.desktop"
	install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et:
