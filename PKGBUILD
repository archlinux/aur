# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="thunar-sendto-clamtk"
pkgver="0.0.6"
pkgrel="1"
pkgdesc="A simple plugin to allow a right-click, context menu scan of files or folders in Thunar."
arch=('any')
url="https://github.com/dave-theunsub/thunar-sendto-clamtk"
license=('GPL' 'custom:Artistic License')
depends=('clamtk' 'thunar')
provides=("${pkgname}")

source=("https://raw.githubusercontent.com/dave-theunsub/${pkgname}/master/${pkgname}.desktop"
		"https://raw.githubusercontent.com/dave-theunsub/thunar-sendto-clamtk/master/LICENSE"
)
sha256sums=('0ec6278c121901088f85477157c78c340e57657da38ff271b71c1160bff59779'
            '7650c80a6fbf1161533a90f1b5a850f72dc60835be453b399228c957a853dad7'
)

package() {
	cd ${srcdir}
	install -m 644 -D ${pkgname}.desktop "${pkgdir}/usr/share/Thunar/sendto/${pkgname}.desktop"
	install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et:
