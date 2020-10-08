# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-bin-x86_64
pkgver=1.17.2
arch=(x86_64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv3-bin-x86_64-1.17.2.tar.gz')
md5sums=('fec9549e4d90ded122d4053be35a3cbb')
sha1sums=('0b63803b85b7bd7ce3e32b3c77ff9bafd2abfbf5')
sha256sums=('2293c981a432dda7a7a14d99cfcdb175aece4dffb52a291e28a53e5982c38428')
sha512sums=('d1b0cda660be8a041efad3062439f5d32f3c39452713e5335ac2bdd8b30b7701352be235f551a55cf7f43915c76be30e978df9b2b81fe161422bf664dfc3e0dd')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
