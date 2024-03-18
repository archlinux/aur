# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.14.8'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('605e5266e50ccb0501b2e1df236cad6c7e5233d1630cd89d8f035a526b90bc33')
b2sums=('9da4676f965a17a3821a9b99588467493570957b88e5096df92ea16918aa8d3b4ac22c27e7ce2c6ebeb4711cb6db7851521cca04761ed07b10011de5b9d0401e')
package() {
	# prepare to copy files
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# copy files
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# modify premissions
	chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}
