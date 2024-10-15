# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.3.1876.3
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://www.loongnix.cn/zh/api/lbrowser/"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('57571abab7db80167aa49f6e8e4ef8c98ff05b7c8aa9e01c420f9b1a275c510e9a66c7126ab70da06f8b051c7af8ccfdc6628f149bfd4d26a26e6ee68b1d9d7a')
sha512sums_loongarch64=('05be0056154b9242af0c7b63abf3d0c2ca2648192162bbd2922e57984e414ae0b150007eb0d2203ca9ad3777d05fef26cab24f82c60e166c9bb7ad5005bb626c')
sm3sums_x86_64=('48bd258115ee47a36ef7c663ab51e9697b85d993d761b5bbc2071dbd4a1eedb2')
sm3sums_loongarch64=('3ecb2dc0b0a38def028bd71b125aed37c07077bd22ee1d2dccfa043ffec8dbe3')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
