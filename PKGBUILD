# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-bin
pkgver=1.17.2
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source_aarch64=("${pkgname}-aarch64::https://webreflection.github.io/aur/${pkgname}-aarch64-${pkgver}.tar.gz")
source_armv7h=("${pkgname}-armv7h::https://webreflection.github.io/aur/${pkgname}-armv7l-${pkgver}.tar.gz")
source_armv7l=("${pkgname}-armv7l::https://webreflection.github.io/aur/${pkgname}-armv7l-${pkgver}.tar.gz")
source_x86_64=("${pkgname}-x86::https://webreflection.github.io/aur/${pkgname}-x86_64-${pkgver}.tar.gz")
sha256sums_aarch64=('afe4b785257c1f8b5c44fd101b21ef645eed560ce29977ab811adea6520ab253')
sha256sums_armv7h=('c6205e155987e795534d91ab59edbd5a3ea3960f6a54d1489aa3c043c69070d1')
sha256sums_armv7l=('c6205e155987e795534d91ab59edbd5a3ea3960f6a54d1489aa3c043c69070d1')
sha256sums_x86_64=('2293c981a432dda7a7a14d99cfcdb175aece4dffb52a291e28a53e5982c38428')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
