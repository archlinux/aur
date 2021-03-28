# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-bin
pkgver=1.17.4
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.4' 'cairo-gl=1.17.4' 'cairo-xcb=1.17.4')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source_aarch64=('cairo-glesv3-bin-aarch64::https://webreflection.github.io/aur/cairo-glesv3-bin-aarch64-1.17.4.tar.gz')
source_armv7h=('cairo-glesv3-bin-armv7h::https://webreflection.github.io/aur/cairo-glesv3-bin-armv7l-1.17.4.tar.gz')
source_armv7l=('cairo-glesv3-bin-armv7l::https://webreflection.github.io/aur/cairo-glesv3-bin-armv7l-1.17.4.tar.gz')
source_x86_64=('cairo-glesv3-bin-x86::https://webreflection.github.io/aur/cairo-glesv3-bin-x86_64-1.17.4.tar.gz')

sha256sums_aarch64=('d5a136add0faa11fef73c91f921ab3767dec9c5192ed29c86b9c99e9c4fb8357')
sha256sums_armv7l=('71e14bab90983f123920e3ffe96aa07fc273fa761618513a8bb135fb7127c4b4')
sha256sums_armv7h=('71e14bab90983f123920e3ffe96aa07fc273fa761618513a8bb135fb7127c4b4')
sha256sums_x86_64=('432b67fe9ec4390fce3e4b7269b0d9db01e88ab3e1ca7b8df39fc169089d0047')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

