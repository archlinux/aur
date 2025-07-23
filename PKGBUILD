# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.3.2189.7
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="https://www.loongnix.cn/zh/api/lbrowser/"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("https://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("https://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('c4e3d59381601124b86bef93d435c4c2e4b47fe0ec281d9e91f868a45ca836eec7ffe59fc8e55f11f92a5c9b51ca14bc63b24e72db27005b66b1def5bf055caf')
sha512sums_loongarch64=('4488332f48b4f6db0c755cbeb3d24b958862f78eb1374eb62e1b7170155333c91d77d975cb2144c80faa67f25564b36f0f4b3d08e01a911d7d1a7a11d6db4ee1')
sm3sums_x86_64=('4b9ebfc5ef2e7526b719cb28763463ef0cc77d77dfc6744f2424b72294a97b2b')
sm3sums_loongarch64=('44990655f390f17d0ab34da2e8def9f77130a7945d8acd2704e820c1c1a9efa6')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
