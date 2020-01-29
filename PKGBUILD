# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-armv7l
pkgver=1.17.2
arch=(armv7l)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv3-armv7l-1.17.2.tar.gz')
md5sums=('ff391da8bac4f6e839b8e5757c256a37')
sha1sums=('bc11d917545131d258bdf2c8b5d7f1161ca6ad71')
sha256sums=('c5cdc70845bfb87ac59d785d3efc21cea10257fba021a1fe2ac15dc0633875a6')
sha512sums=('2202f088ba78e12a593c1d0000e846aed11a6e42ebdce4fd56f40ef8d8275a5672ee2f49fa073ea5d0788abb04431d3ea8933e0f357b078a72cdcfcbd85e5f14')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
