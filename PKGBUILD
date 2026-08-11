# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=catppuccin-plasma-colorscheme
pkgname=(${pkgbase}-{latte,frappe,macchiato,mocha})
pkgver=0.4.0
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
sha256sums=('8e263479d67917c2ba4cd5d2e8f1a8981c39a3ac366c3ad2d7c440cfa4761277'
            'aba81e624d638501a76edf3ac63f87d003c0a02ec2781cead802d903f4e75c06'
            'dffb1649fd6e9af4316d960efcfa236be021c281bbae7dc45110e5d57876d2a1'
            'b40b21a06c5e5b59c4323582283141e635cfc7e15f01c0c6f9c9c2646d9f7aee'
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
