# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=catppuccin-plasma-colorscheme
pkgname=(${pkgbase}-{latte,frappe,macchiato,mocha})
pkgver=0.2.6
pkgrel=2
pkgdesc="Soothing pastel theme for KDE Plasma"
arch=('any')
url="https://github.com/catppuccin/kde"
license=('MIT')
depends=('plasma-desktop')
source=(
	"${url}/releases/download/v${pkgver}/Latte-color-schemes.tar.gz"
	"${url}/releases/download/v${pkgver}/Frappe-color-schemes.tar.gz"
	"${url}/releases/download/v${pkgver}/Macchiato-color-schemes.tar.gz"
	"${url}/releases/download/v${pkgver}/Mocha-color-schemes.tar.gz"
	"${url}/raw/refs/heads/main/LICENSE"
)
sha256sums=('efcdaf787e0bc956a6f88d61d09d319257ab4e063ee33341d2651ac5d2f83062'
            'e950ff67aa8e17dc3ca5227298793340b6b03911d057d4ad864dd86680e06b91'
            '8f1eb6a3551ebc3c8ef71cf514214619a70c96c8bbed0381ea829425b9619cb9'
            '02420de74376a44d6188238333a68caae3776528ec0ffe57f394697db60f96bb'
            '814096d2c34cc216c624738a49356f32b7237733b4f7edb0685f4e50ef5074ba')

package_catppuccin-plasma-colorscheme-latte() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/color-schemes/"
	cp -rf ${srcdir}/Latte-colour-schemes/* "${pkgdir}/usr/share/color-schemes/"
}

package_catppuccin-plasma-colorscheme-frappe() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/color-schemes/"
	cp -rf ${srcdir}/Frappe-Colour-Schemes/* "${pkgdir}/usr/share/color-schemes/"
}

package_catppuccin-plasma-colorscheme-macchiato() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/color-schemes/"
	cp -rf ${srcdir}/Macchiato-color-schemes/* "${pkgdir}/usr/share/color-schemes/"
}

package_catppuccin-plasma-colorscheme-mocha() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/color-schemes/"
	cp -rf ${srcdir}/Mocha-color-schemes/* "${pkgdir}/usr/share/color-schemes/"
}
