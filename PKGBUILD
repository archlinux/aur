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
md5sums=('07cca5ed72a6b74dc8815ae8548c0268')
sha1sums=('6a1e731e5836722563b9caa62d4ac1ee6abd23a7')
sha256sums=('85409173668c2a784f3ee064efff492596ca2bf32fe7c4d0cb4ab9b5d938f633')
sha512sums=('f9f793154c93b018ca7656ea8ed3c7f0f3b78ce33306ac5fe42de1a47ed72431b8ab85c4c9bd930dad9e84258a4b949e2088c19cefdd8cefef64764cd0c29ae5')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
