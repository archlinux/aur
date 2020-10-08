# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-bin-armv7l
pkgver=1.17.2
arch=(armv7l armv7h)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv2-bin-armv7l-1.17.2.tar.gz')
md5sums=('a3708f880d28353629ebf15c8149aacf')
sha1sums=('766acd6260b3a8c796be4c712792ef24ce89bfb7')
sha256sums=('5f96038b8d567180009a6b82c8ad40610631134748ed788f9d7661049003f6c4')
sha512sums=('2b00530417dae3f53768b6761845345f11ea3e3bcbfee4b4da6ece242ad5a56dc79c9281a53aac3d34e328b65a41c4a3e7e4b349695d593ed7cfaaa522613a0f')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
