# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=snowboy
pkgver=1.3.0
pkgrel=2
pkgdesc="DNN based hotword and wake word detection toolkit"
arch=('x86_64')
url="https://github.com/Kitt-AI/snowboy"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Kitt-AI/snowboy/archive/v${pkgver}.tar.gz")
sha512sums=('3edd3038c11beb9ecc9a7f73f91c7097ec869841eade6715df061987313cdad60d7090d494f3d161bf64c921d5f75e8f64a2befc6bf7202b468f0122c7ecff1a')

package() {
	install -D "${srcdir}/${pkgname}-${pkgver}/lib/ubuntu64/libsnowboy-detect.a" "${pkgdir}/usr/lib/libsnowboy-detect.a"
	install -D "${srcdir}/${pkgname}-${pkgver}/include/snowboy-detect.h" "${pkgdir}/usr/include/snowboy-detect.h"
	install -D "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
