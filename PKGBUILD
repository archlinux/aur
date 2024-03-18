# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.15.1'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e75a62b515764e2cd04d3565fd0aa6650d44db384ca0572431cfa5c8f715d8cf')
b2sums=('8d1fd4b1d0ddcdb05217ad2f7aa82535ad87efdeaea789ac2f223e67c07d8fcde9ac408caa3d7625cba930a3e3fc7d86f697be573f7a1f8bd79d15af41071b21')

package() {
	# prepare to copy files
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# copy files
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# modify premissions
	chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}
