# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=godotpcktool-bin
pkgver=1.8
pkgrel=2
pkgdesc='Standalone tool for extracting and creating Godot .pck files'
arch=(x86_64)
url=https://github.com/hhyyrylainen/GodotPckTool
license=(MIT)
depends=(glibc)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=("${pkgname%-bin}-${pkgver}"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}"
		"${pkgname}-${pkgver}-LICENSE"::https://raw.githubusercontent.com/hhyyrylainen/GodotPckTool/v1.8/LICENSE)
sha256sums=('7e3a35c7abe7041b12b9b5f6b51b717bdb0d38ce466a11b05551ed489a717948'
            '9713a591001e5fa3d46f2af637b12c35859247a5fe8788abc794fff89f5d5fb8')

package() {
    install -Dm755 "${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
