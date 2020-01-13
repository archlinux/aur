# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-armv7l
pkgver=2.26.2
arch=(armv7l)
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices (gl version)'
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
provides=('wpewebkit')
conflicts=('wpewebkit')
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 'libwpe>=1.0.0')
source=('https://webreflection.github.io/aur/wpewebkit-gl-armv7l-2.26.2.tar.gz')
md5sums=('d2f1d34cfd4bbd22194834b940f8f732')
sha1sums=('0055f85ef6bc5c5da36812d0f346900d58a5c645')
sha256sums=('cff7ccf2a7a54fab0fd6a68774776a4ef0769d3e20c3851e24a31e51fcc80ea3')
sha512sums=('b54b9f88aae09c6a12598c8dcf4bc2ea89c6d4bf6f80da1db902fb79122733461ef014a464538259b5d19565381991ef34ba9bd9b4d35a66e11b528d03349b2c')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
