# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.3.1615.0
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://www.loongnix.cn/zh/api/lbrowser/"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('4eba3aad6ed54c1c3a1d966944e7f03db706f8616349811371792fcfc5f396a33684e7b5ca3f3ce93922a8f8f437cf34a9d97e0d082c58864e8f09949a82def9')
sha512sums_loongarch64=('f814e69702d2a827247dfd288e0db32113515492598fb499193ebbeeb0f4c7c4c8c71f31591fd07e7f4fd06a1761808f4a1d0026e26ed31e745d3ee6bb9c72ec')
sm3sums_x86_64=('790a5e3ffdde49f92092bfd152594a40f819eb51ccba905c589b1574d412e451')
sm3sums_loongarch64=('48b38864dcc976f28a1aeff43f8717032abe976af4be000704cf9ff4ce3bc127')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
