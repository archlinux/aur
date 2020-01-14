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
md5sums=('95ad74fa403f509fcb7127ac927a264e')
sha1sums=('53b065e4a87677b2832f9ce2e4cdd21a6501fb95')
sha256sums=('db1d0edf075eb7fe30deb9b423da1915a66cb2b8ba573cf8205034fa888e7687')
sha512sums=('b29df24ee895a52bbdda11d47b64eb11423a478747ea66eb15960fb3249f8a8df01a1e57c39d89e37afecea0243f3889c5e41a6fda218cb066972ffd4d22f19b')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
