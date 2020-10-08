# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv3-bin-aarch64
pkgver=1.17.2
arch=(aarch64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv3 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv3-bin-aarch64-1.17.2.tar.gz')
md5sums=('1a5aec41090ed4a207901874eebcebf6')
sha1sums=('7a3881c8631278dc12b7fc773b9b7a598ad11bb4')
sha256sums=('afe4b785257c1f8b5c44fd101b21ef645eed560ce29977ab811adea6520ab253')
sha512sums=('41d1f908099d7603a57d4a6892a7ac662a54c3ebfdf0d8441d9da78db79d157ddf0a8e3a5bfcccc40e9e6470014a62e193178bbd32d542daa062ecf8eae95c0a')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
