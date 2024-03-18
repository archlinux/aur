# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.11.2'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=("f55b63c9ead2e7717c09e7e378d4a23f529832c6f8d9ee3a21dca0c295c5e0bc")
b2sums=("664ab73d155420af963751f0c40d540912a8c7ad1e8bd9a8a0f5e89edd23012490a811b31057ec382f834820a0047ef1763b63938ef4bf7e1dad4b6afcf701b1")

package() {
	# prepare to copy files
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# copy files
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# modify premissions
	chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}
