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
md5sums=('06f74c80b399ce8580de69d18f8e1e0f')
sha1sums=('468ba9a4920e8e92e2f69f59b7d275db3ca366cb')
sha256sums=('79a0f987d0d7049eb8f513ce89d1c11486cf541d79e4b6a7376bb1a56ae978a4')
sha512sums=('e19a31e511bd1d4b1c5c52d4a6cfc93097e8fd5a2c4981b19c5d63eba2c38c66b5f4cb04b386cf603c44afcf41bf4f5dbbdfbd114592a8b2b5272869807410af')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
