# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-aarch64
pkgver=2.30.1
arch=(aarch64)
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices (gl version)'
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
provides=('wpewebkit' 'wpewebkit-git')
conflicts=('wpewebkit' 'wpewebkit-git')
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 openjpeg2 libseccomp bubblewrap xdg-dbus-proxy
		 geoclue at-spi2-atk libwpe)
source=('https://webreflection.github.io/aur/wpewebkit-gl-aarch64-2.30.1.tar.gz')
md5sums=('b638c9be1335de2e7f5b6e8d4aa979d5')
sha1sums=('22cb2d9776d5e64fe518d610d7424bde94ee1a0e')
sha256sums=('65aaac28444c2a17a8bf9a98153ed02b06ef50ab6c0949229271047fc8e3abac')
sha512sums=('2893c078f296a4e49971d855a763e083103f40a90976b573ea4fe4714e9535d5db5d6c0f2203f99a74cdb72a45d72918d0c911f1111c9c446f1a16dc0d86af65')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
