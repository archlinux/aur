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
md5sums=('c8f2e5bf7c113287089b1ff1e5e24efa')
sha1sums=('66c4e8bdb0daba1751b89d0aa7b24bf813b3e654')
sha256sums=('9f6affd1eb07dbf102815e6f8c1f0c1f660caf7fe37a0b9bc003908e1b079575')
sha512sums=('9e50b797ab9d22bdb1d2fe886d88ed45c39166a5b9d301775fe5c68467498c249b73349086d670ec52cdc19b67af4dc5c08961b8f1b20004c6576d6882630275')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
