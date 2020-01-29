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
md5sums=('be7aae6194a0a8c444fd2869d16f791c')
sha1sums=('fc5ee9e1bd9a9053f07bbb3285ebe7c68bf707e3')
sha256sums=('21d54c2bf2243cd6f209812d985750468e3e6b9d2e11dd7a0edfd00745b3396d')
sha512sums=('54414fc2dff1dac733deda2dc9e7308840c22bf9ae234ae66ae9829cc7c7b63605f09a7b3922612347a1d1873747f4a3b54a7e3f9d4bdb6d255325e9e8c6ed2f')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
