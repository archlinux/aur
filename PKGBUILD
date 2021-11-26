# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=godotpcktool-bin
pkgver=1.6
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
sha256sums=('10de843a7b4fcc8a36c90bb92aa784d84894526ee223f46f273ab3342e446f94'
            '00de469d52a421d6a9cbfc3d5c23d1fe1c873d72e97762eab794940c193892f7')

package() {
    install -Dm755 "${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
