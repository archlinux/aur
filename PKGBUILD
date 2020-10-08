# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-armv7l
pkgver=1.17.2
arch=(armv7l armv7h)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv3-armv7l-1.17.2.tar.gz')
md5sums=('7952971516b7e17fbf586e536eded42d')
sha1sums=('4fef81c192d2ef30d0764f8747f27a2a6c32d624')
sha256sums=('fa2efa9ce1554b01a8fcc263406abb43c3a9d4ffc960111410e79f1b2e6811b6')
sha512sums=('4708c0bf784a25220ec5065102a4289afbe08dc14d89cf5173b533af1ae9fa35db98dce59330ed80a75df8bdbe12127bbb4d089abaaeeccd7f0230b62636af6f')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
