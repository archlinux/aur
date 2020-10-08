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
md5sums=('1bdcbae3c744fee0a3a00cb1059c2757')
sha1sums=('6fbfe23c4cc8bbf084041f3cfac5afadffa64e8e')
sha256sums=('4a5cb0d2a4cd0d37d2e23d160bea56c0b5e4dc5c6df38ed42f845ccebb49d879')
sha512sums=('d0a760aad9c1254ada10a41604dfbc1669e659304d27e3a7814a7e599c2ca79c4563a9d37e21b5f4d8fdffe28797752d64d7d303fdb35be99f5be4cf734a0a3a')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
