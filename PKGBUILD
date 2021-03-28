# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-bin
pkgver=1.17.4
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.4' 'cairo-gl=1.17.4' 'cairo-xcb=1.17.4')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source_aarch64=('cairo-glesv2-bin-aarch64::https://webreflection.github.io/aur/cairo-glesv2-bin-aarch64-1.17.4.tar.gz')
source_armv7h=('cairo-glesv2-bin-armv7h::https://webreflection.github.io/aur/cairo-glesv2-bin-armv7l-1.17.4.tar.gz')
source_armv7l=('cairo-glesv2-bin-armv7l::https://webreflection.github.io/aur/cairo-glesv2-bin-armv7l-1.17.4.tar.gz')
source_x86_64=('cairo-glesv2-bin-x86::https://webreflection.github.io/aur/cairo-glesv2-bin-x86_64-1.17.4.tar.gz')

sha256sums_aarch64=('c2ff31a745ac148c20c2fd8793e73ec25e2e9b45408e1f2087a2b33c10800cf9')
sha256sums_armv7l=('da71a142eda45e48dca68c28d9c240c4e5f137e2b729a0c8ceb42b2d0551c818')
sha256sums_armv7h=('da71a142eda45e48dca68c28d9c240c4e5f137e2b729a0c8ceb42b2d0551c818')
sha256sums_x86_64=('aa6d95affef764f966188215601cbf09e65c1e7446bf39f34869f3ff684bcdd4')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

