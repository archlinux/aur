# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.2.2211.3
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://www.loongnix.cn/zh/api/lbrowser/"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('80e0943163a098ea6d2217b3b69046ab911da6cad79cd921dac9457c4610c09d25710f4df1ee213e527d0b0d6b914e7f17a425b63d0015de52c4286ed1d8c14c')
sha512sums_loongarch64=('029c0574838156d2848d91bd4bd58133168b09bd123f45e17200141c97db1aea959649d62f79c6b2a5367aa909f35b71db32ae1a0e6d71102b294bf53131ec2b')
sm3sums_x86_64=('790a5e3ffdde49f92092bfd152594a40f819eb51ccba905c589b1574d412e451')
sm3sums_loongarch64=('48b38864dcc976f28a1aeff43f8717032abe976af4be000704cf9ff4ce3bc127')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
