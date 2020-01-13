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
md5sums=('e1d23127f55376982983e8a90af5840a')
sha1sums=('023a78cc88b9e0a66e4b71b3d655ce2ab3228905')
sha256sums=('f590ecc1826595b0ee5a05edf9adec1ef390ece9f47e206c7aa9d2dd0f614285')
sha512sums=('d8515656fb7737b0adc52e5f705dfa829f72483290fdf885a962b113ed42dd85a578a2069e386c0aabfe5d2bf9b58d578a00eb229336f89c99d7223dd954947c')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
