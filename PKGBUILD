# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=catppuccin-plasma-colorscheme
pkgname=(${pkgbase}-{latte,frappe,macchiato,mocha})
pkgver=0.2.7
pkgrel=1
pkgdesc="Soothing pastel theme for KDE Plasma"
arch=('any')
url="https://github.com/catppuccin/kde"
license=('MIT')
outdepends=(
	'plasma-desktop: Plasma support'
	'qt6ct-kde: Non-Plasma Qt6 support'
	'qt5ct-kde: Non-Plasma Qt5 support'
)
source=(
	"${url}/releases/download/v${pkgver}/Latte-color-schemes.tar.gz"
	"${url}/releases/download/v${pkgver}/Frappe-color-schemes.tar.gz"
	"${url}/releases/download/v${pkgver}/Macchiato-color-schemes.tar.gz"
	"${url}/releases/download/v${pkgver}/Mocha-color-schemes.tar.gz"
	"${url}/raw/refs/heads/main/LICENSE"
)
sha256sums=('4f6642f3587adc0cd73a80feb554ecabb844aa027aa515d1f69b7a8a72dc15a4'
            'faed2b1336ecde6ebe3109ead0e0f56a50e8e69c42add3b6417e00d0bd015135'
            '93d661c2d80425cb37508dfe370b9f3f145a3b2ff3f37f72993dfe1a83af5d37'
            'adcf544778b713c6a22001bda17cde6061679feccdfd0c863920faab11866f87'
            '814096d2c34cc216c624738a49356f32b7237733b4f7edb0685f4e50ef5074ba')

package_catppuccin-plasma-colorscheme-latte() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/color-schemes/"
	cp -rf ${srcdir}/Latte-color-schemes/* "${pkgdir}/usr/share/color-schemes/"
}

package_catppuccin-plasma-colorscheme-frappe() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/color-schemes/"
	cp -rf ${srcdir}/Frappe-color-schemes/* "${pkgdir}/usr/share/color-schemes/"
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
