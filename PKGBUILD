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
md5sums=('464da097ffda63f188c4975a6f18fee9')
sha1sums=('0896bc209ac32b160b5adcd44eed0dfd55fc4588')
sha256sums=('74e84d47c6d549ddbcc2eaad7f0eeebe913dabf9c6bc0cb4f417ba3a7116061c')
sha512sums=('5412bfe1232217a9b8249515550587f9a42c38206327855dd906cf1d0efb29d8f59918f69ed0eb8e871d93a8a5d563edd6f3af748404bae0c369685e0d328642')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
