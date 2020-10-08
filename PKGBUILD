# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-x86_64
pkgver=1.17.2
arch=(x86_64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv3-x86_64-1.17.2.tar.gz')
md5sums=('e108de14598d8b6845056474ca6702fb')
sha1sums=('985f99d126faba41b4f219fb451f72f46564ca23')
sha256sums=('2b2432de9dfabbfc7f7ea11ddde5c6778f6952692a75cbd7747922d869ffc4b8')
sha512sums=('844476bb997550c558c87c7bdc1745ec79f6cf80c311036bd5c9b45f813d6dd7a1295f3baa2cef5981c609a2cc0714031d4b0100cf94907e18cf69fe27b8b2d7')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
