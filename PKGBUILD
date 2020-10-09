# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-bin
pkgver=1.17.2
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source_aarch64=("${pkgname}-aarch64::https://webreflection.github.io/aur/${pkgname}-aarch64-${pkgver}.tar.gz")
source_armv7h=("${pkgname}-armv7h::https://webreflection.github.io/aur/${pkgname}-armv7l-${pkgver}.tar.gz")
source_armv7l=("${pkgname}-armv7l::https://webreflection.github.io/aur/${pkgname}-armv7l-${pkgver}.tar.gz")
source_x86_64=("${pkgname}-x86::https://webreflection.github.io/aur/${pkgname}-x86_64-${pkgver}.tar.gz")
sha256sums_aarch64=('aa07a121ab182cfd96ab32d4f08f620a642559d1a0e17ea09d9b1f50fe4fce1d')
sha256sums_armv7h=('5f96038b8d567180009a6b82c8ad40610631134748ed788f9d7661049003f6c4')
sha256sums_armv7l=('5f96038b8d567180009a6b82c8ad40610631134748ed788f9d7661049003f6c4')
sha256sums_x86_64=('2a9f366f34538f18cf5d00c439b9739b1e34e3967e9f6337b313aa351e8d3c2a')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
