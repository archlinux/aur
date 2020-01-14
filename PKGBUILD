# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-aarch64
pkgver=2.26.2
arch=(aarch64)
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices (gl version)'
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
provides=('wpewebkit')
conflicts=('wpewebkit')
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 'libwpe>=1.0.0')
source=('https://webreflection.github.io/aur/wpewebkit-gl-aarch64-2.26.2.tar.gz')
md5sums=('e9865762256a3cd2f629d6bb7abe3a36')
sha1sums=('44ee56e4224064e4245821b858aa1a37a23f8c6b')
sha256sums=('d590d71e5d7f63f0efcc0a2ab8a76908341014a9f5c651eaca147e59a81bbd82')
sha512sums=('3b063984ee7d8b65c7f023e29b585de7cc3cbd6870fbb5d237292ea544062e64de36f7298921644578dea353a78aa210ae24755e4ddc8bd1db829f7615f9d3ac')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
