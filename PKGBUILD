# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-armv7l
pkgver=1.17.2
arch=(armv7l)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv2-armv7l-1.17.2.tar.gz')
md5sums=('1ba298eb3d2b5c5cb0e529837611cda4')
sha1sums=('7df055358b8b9eb077adead9fedef65a16e44461')
sha256sums=('535a3a967332953f60dc7912ee1ec1b4aa1f52b2b4da6e5cd04dc2d0e3c3bd5e')
sha512sums=('4780107453a86aee9d89d1dfec8bf4cd847b4a2132baee666627086cb689a4f1c67bc6a22211040f3c4365d6c8f2dc138e86ecb8283b1b90be99e0babf2fe8b8')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
