# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-chii-devtools-bin'
_pkgname='chii-devtools'
pkgver='1.0.0'
pkgrel=1
pkgdesc="LiteLoaderQQNT插件，使用Chii进行远程调试"
arch=('any')
url="https://github.com/mo-jinran/${_pkgname}"
license=("GPL")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-chii-devtools")
conflicts=("liteloader-qqnt-chii-devtools")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}.zip")
sha256sums=("21482e19dc675a3f7b94274f18ae23b4b942511950d310c5ee81b0a876c08d5d")
b2sums=("d9ab53b5ecaaa509ebbe2504769b9e9e08d6b9bee77af0673cc75895331f79762e081564ac096ebccd932af29771e858b07fd9884ae47b327c5438075eab599a")

package() {
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	chmod -R 0777 "${pkgdir}/opt/LiteLoader"
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
