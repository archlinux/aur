# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.3.2001.5
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://www.loongnix.cn/zh/api/lbrowser/"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('0cf028c11f39c65398ad292c699a02d220fdbc7801ff7371c64d4b7ac2ac2bdb8f873c14cb6fa60a3dee8a5d4b36d9ac4ec59fa30582f5b9701e7e85e1cc7e8d')
sha512sums_loongarch64=('02a9944b35c629292cc0fddcd9d3b4ac77cdb83ad353462fb68004d2b7207cdf2f3b0754fa15ee43c9eb2e4f2216b9d43a96ee16a03b1cdba55488fa49f7c369')
sm3sums_x86_64=('499ddf0486f6cefadcb07e63a9e399dc6e29ba6c416611633d3d64c5d887fe8c')
sm3sums_loongarch64=('b7eee954f1d2e38cc2b5fa1dda4a64deeb887b8c33804cd8ecd1ad91cc08af13')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
