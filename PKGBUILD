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
md5sums=('b3ad113e78a97ee71c859545586a4a2c')
sha1sums=('53542328c87d2a2e820454132d4c9bf902ab5cc6')
sha256sums=('e1b7b42e51cb3a87575e3df636f0b9f1260601f0e8d73f03a89346e60b7db544')
sha512sums=('9b9bf9f2bcc86593cd9d3b3e07fea233963aa54a082b475898a6a589e24b8886b7d758ab87a25e6af684a98e9750f91f00a1261044adf4b5259a91957c4e2eaa')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
