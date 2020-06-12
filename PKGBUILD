# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-armv7l
pkgver=1.17.2
arch=(armv7l armv7h)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv2-armv7l-1.17.2.tar.gz')
md5sums=('40b8b61a45ac458852a0f8bc7ba51fef')
sha1sums=('036ee3985e36778cfaca307592618f85f1e7767b')
sha256sums=('b086bcd4241eda9bfd3b89273aacc1a84f829ef1d6ec036fa7fd853fe811b02c')
sha512sums=('59c9eda6588d5ae169f4d4d62eb1f18f998b702c51d038890b2d7333c9b6cf440f841f356cf4fe3fb3a8518ae0b9dac9c4aa4ff9c3b20a4d9e244548557ae68f')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
