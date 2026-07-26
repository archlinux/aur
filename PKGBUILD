# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=catppuccin-plasma-colorscheme
pkgname=(${pkgbase}-{latte,frappe,macchiato,mocha})
pkgver=0.3.1
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
sha256sums=('ab9a5bdb599d10a476698b8e55e55c2b0b4762e65feca21fff2224a21c3fc000'
            '5593983746de7e30d3554a6cf680c9378e409268812679f3189ccb0988c481f6'
            '85bc96dd54ce7cc25ba656c5b44b8d86efd4ab6b0152c699abd00d2c6c8cb402'
            'b569b33f1abd9549e4292f293b3f73d827126045f0fd7927a25e3598c8d25742'
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
