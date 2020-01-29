# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-aarch64
pkgver=1.17.2
arch=(aarch64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv3-aarch64-1.17.2.tar.gz')
md5sums=('49b523cd136c3daa9d74b242eff40426')
sha1sums=('f219514c269dcd599135689feea739296395bb09')
sha256sums=('1eb9cfc841390af9a8b649d437c5cdbc19a68fd18520a877c00a98fe558df600')
sha512sums=('5c64763b79d4edef21987f52a22cf8900f264a59a21c1b84541b6945d1bcea585db391b326ea56982c7be4776f842bc7838e50681c53b242de9e650ba1ef47da')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
