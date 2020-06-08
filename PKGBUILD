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
md5sums=('4d8b3619bdb7360f205e1fa5faa9bcb1')
sha1sums=('b5c5e28195dae01252bdb5f3820290cebbda79c5')
sha256sums=('62ee8788502ab20ba654eb3bcbda5716d95e91b05c5c75af7d1212f42eb09b31')
sha512sums=('412fe3aa6adbb92f23e4a896f8b3ad919fc33a4936b5418a45b90045177ddc120df8987728c72994e541a6ccf0b1f3574334cc3c84170aa982dbab3f6ab3bc2e')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
