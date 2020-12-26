# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=godotpcktool-bin
pkgver=1.4
pkgrel=1
pkgdesc='Standalone tool for extracting and creating Godot .pck files'
arch=(x86_64)
url=https://github.com/hhyyrylainen/GodotPckTool
license=(MIT)
depends=(glibc)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=("${pkgname%-bin}-${pkgver}"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}"
		"${pkgname}-LICENSE"::https://raw.githubusercontent.com/hhyyrylainen/GodotPckTool/master/LICENSE)
sha256sums=('f2f38c1f651b4b3dc09c25064142d4e4b13d51d392f996ffe2727b599ff0e732'
            '2991d0067840841a14a5971d4cc9a2c3c82496ae52fa402919d17f1ce95a92fd')

package() {
    install -Dm755 "${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
