pkgname='liteloader-qqnt-telegram-theme-bin'
_pkgname='LiteLoaderQQNT-Telegram-Theme'
pkgver='4.2.5'
pkgrel=1
pkgdesc="LiteLoaderQQNT 插件，高仿 Telegram 风格的 QQNT 主题"
arch=('any')
url="https://github.com/festoney8/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-telegram-theme-bin")
conflicts=("liteloader-qqnt-telegram-theme-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('579e44e2bfa794870f510a7a4a7a211496de46ff15d1b988aa44969672510f3f')
b2sums=('80dc553a5304732a508ea03225e255a0a04a807360f40cddc0bf5e42ba59e95f12a5bbe356b87fa70fb60088d1fa7d12f4b86d4f0bd651f9bc1ccfee6c2687ab')

package() {
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	chmod 0755 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
	cp -r "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
