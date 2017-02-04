# Maintainer: Xiang Gao <qasdfgtyuiop@gmail.com>
pkgname=thrust
pkgver=1.8.2
pkgrel=1
arch=('any')
license=('APACHE')
url="http://thrust.github.io/"
pkgdesc="A parallel algorithms library which resembles the C++ Standard Template Library (STL)."

source=("https://github.com/thrust/thrust/releases/download/$pkgver/$pkgname-$pkgver.zip")

sha256sums=('00925daee4d9505b7f33d0ed42ab0de0f9c68c4ffbe2a41e6d04452cdee77b2d')

depends=('cuda')

package() {
	install -d "${pkgdir}/usr/include"
	cp -r "${srcdir}/$pkgname" "${pkgdir}/usr/include/$pkgname"
}
