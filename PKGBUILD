# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=cairo-glesv2-x86_64
pkgver=1.17.2
arch=(x86_64)
pkgrel=1
pkgdesc='Cairo vector graphics library (glesv2 version)'
url='http://cairographics.org/'
license=('LGPL' 'MPL')
provides=('cairo=1.17.2' 'cairo-gl=1.17.2' 'cairo-xcb=1.17.2')
conflicts=('cairo' 'cairo-gl' 'cairo-xcb')
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
source=('https://webreflection.github.io/aur/cairo-glesv2-x86_64-1.17.2.tar.gz')
md5sums=('dfb365998f9a02533d25d993359d4696')
sha1sums=('7cd5ec6b73c62a8a401d562da5eb4d37d0b05160')
sha256sums=('2f701797ee0206a3b8a0cb25fe204211011670560772890a2792a02548a6bc55')
sha512sums=('59d3ec265a15f39e0011cb59f9de7e7fd1382e6bffbd8100198f4a75eabd40a54b50be5375dce52f16963c1fd755c6e21bc369c5c02cc0a02176b4a281a0aec3')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
