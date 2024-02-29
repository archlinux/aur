# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="thunar-sendto-clamtk"
pkgver="0.08"
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
sha256sums=('658d90c53bd10f7ddc12074e66b90e98627ef3d59b88ce940b5ea2a311746556'
            '38935a05d2183952532e67d8ec6d5799f80dee100b6a7afadf5b77f511acb096')

package() {
	cd ${srcdir}
	install -m 644 -D ${pkgname}.desktop "${pkgdir}/usr/share/Thunar/sendto/${pkgname}.desktop"
	install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et:
