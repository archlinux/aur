# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.14.1'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('3edd0c8f7fae6db4b9c9f91b79a04b7b0b792f79299f92c9c3215f37d7c8d863')
b2sums=('f77ce3e3d3f5d262afc6275eed258cd02b123ea5ae6b213b2e6fe32cf2e6914a830472d7c4d8745002d9fc728c27dbbe1cb9e7dbf648b63b8da85ad249400cbd')
package() {
	# prepare to copy files
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# copy files
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# modify premissions
	chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}
