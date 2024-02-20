# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.3.1749.1
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://www.loongnix.cn/zh/api/lbrowser/"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('191033bc2df6fdeab70f01063186fa100a571fb02407a57039fea83d3e8b36aca03de2e17280ef4b3e2cd0fc9fe977c23f4a534484eff1d790e0eba2aa7c92b4')
sha512sums_loongarch64=('3ac07c40269618830cabecf7dce724c13aae0c8c1e5c8a85701a69f1ca989c44e077138755e127013ec56faf5a53d2a6fce0ae3c4723eb7ba4f21c72b9b724f4')
sm3sums_x86_64=('c2307574e9e2f505e2518542003fd8b95e147db1f44bbd7469bfd61afc10c169')
sm3sums_loongarch64=('23fcfcfbceb2872569f924900731691222910efba23bb7ac1dcd45212f754d0e')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
