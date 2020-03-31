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
md5sums=('1f1caec2ed701429be662e5c5a152a07')
sha1sums=('fbc19d8f4f6319d96b5a5542156fb177cf24897d')
sha256sums=('3aa3ab062e62cc362ea78f60caf5042ededc6e0a1b1592f325fa04bc51f456bd')
sha512sums=('77c3383f062b0e1794aa054276896b0341ec8f92541e928e3ea11ab896349cd737afc257605d48672ee4f4ad82f0074b95add60e03ae8565f1f37d632bbc037d')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
