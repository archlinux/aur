# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-aarch64
pkgver=1.17.2
pkgrel=8
pkgdesc='Cairo vector graphics library (glesv2 version)'
arch=(aarch64)
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv2-aarch64-1.17.2.tar.gz')
md5sums=('7d9009c37366c0d6bbe9a41c385b1db2')
sha1sums=('c37de38dacfe1b220e4c86157630825f1fb25f84')
sha256sums=('72726d8093dbd8affcd0b8bb7c09bc141df7132d4c5d003c2d73fd7e86473963')
sha512sums=('e337de541aca9b3e910219367408ca6e1d06330211f42ed82b8a7af360efe8d1e9ca15082593bfa8e7b905ca6ad3eafea6008b49614dd42ecf9febc134a069c8')


package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

