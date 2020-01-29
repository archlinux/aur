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
md5sums=('570bed71b3d4cbfe03e9479792bfdafb')
sha1sums=('80c2eff3fab6963ba3a3dc4ae70ad6d067fe0b8b')
sha256sums=('2c3d7d123df151938993cc4cc6d8e0a51ade7191a730b6105004b2c69858db3c')
sha512sums=('1deba3470719fdb48775263e36b8a948ea2b11b8889b3f4fcb6d0a84a868ce8c1c31b9b78e6767cbc6c613ac3caad7580cee51a345d04d0ae29d6dde8ceaff9a')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
