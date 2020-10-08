# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-bin-x86_64
pkgver=1.17.2
arch=(x86_64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv2-bin-x86_64-1.17.2.tar.gz')
md5sums=('b5be049a1921b84803c29ae77e10f3cd')
sha1sums=('b0aa37707128b97a26376583d72d64e927663d61')
sha256sums=('2a9f366f34538f18cf5d00c439b9739b1e34e3967e9f6337b313aa351e8d3c2a')
sha512sums=('67dd0d35ab8d865fa9d0a7d76fa8586e54ab69ec6b5d9c048126ede1169d92cf2a2060d524533f9ee73e39161c552e5fa5c60a8ef2df550d0888f656aa9ba3df')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
