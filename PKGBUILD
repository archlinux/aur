# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-aarch64
pkgver=1.17.2
arch=(aarch64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv3-aarch64-1.17.2.tar.gz')
md5sums=('e01bd27ca099d9793879cd84aff7d95f')
sha1sums=('a469064acee8ca48677504a8f4f588dcbee8ff40')
sha256sums=('68ed53b17ed771bab0fc3fd2e696f1ac8c805256b6363449b6221641b4f0a608')
sha512sums=('3c0e8d61145fd86f9d3629861722a31e0ab450ca23332f91a4f66e627a676f2c20ab1936fb3fc275ccd01fa9429105d4d82956858011c368850886861cb9d7fd')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
