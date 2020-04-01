# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-aarch64
pkgver=1.17.2
arch=(aarch64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv2-aarch64-1.17.2.tar.gz')
md5sums=('089084ca2fdc2282d9b3ad05f74e2012')
sha1sums=('51cab6a9d1aa85cd761097658b6dba7582c43500')
sha256sums=('72c74cd0eec619bd428555ab0ede23ea253edce2e130547b8a0a4ea3811109f6')
sha512sums=('af51860d84d171c908a290a714eeb6eeeb085a827ced35a3d86e37738a75f728219e39f70596e24f3c75bd3b11ac022c8a94546eb714c00a45716fd9e341cb63')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
