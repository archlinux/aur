# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.4.2039.0
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64' 'loong64')
url="https://www.loongnix.cn/zh/api/lbrowser/"
license=('unknown')
depends=(
	'gtk2'
	'libxcrypt-compat'
)
conflicts=("lbrowser-v2")
source_x86_64=("https://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("https://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
source_loong64=("https://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/abi2.0/${_pkgname}_${pkgver}-1.stable.loong64.deb")
sha512sums_x86_64=('7627294735a52e5f66dbe6718ce19baf2b7db2d26abb2e2e813b543e6e02984f80a535449753734cc187efadff10d4bc10cbd606ac757069b2698801e32572e0')
sha512sums_loongarch64=('9834b1bf6567e87237447f906a77fac4c502e939e9ccf4243a5d6358bbd982d212c7a64588bcd371ffe7715e49ae269e2114d7a56448f5636aa8b08eaa6ad601')
sha512sums_loong64=('8529b6d4ea9e90efa9316d399cad18f17b38d81567d05e4a1b22810955f91e09af18b278dbeba2b7a99f604e24bfa435a9daf47489001d895bcfd947a2cddb86')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
