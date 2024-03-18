# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.15.3'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('6ee25f87df5e42c28aa6adee3e8d9561c2a07f4f3970974c6c40d16fdbb3411b')
b2sums=('94b548bcf29dac7c8a57312d874c5de3e066f1f9e2cdd810abdd9707b3a4b19027bd10ffa654c65c36f49119f7236cca18c1164696b2e7f58ab9f231a6ba2e8a')
package() {
	# prepare to copy files
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# copy files
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# modify premissions
	chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}
