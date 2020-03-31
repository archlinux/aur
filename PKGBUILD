# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-aarch64
pkgver=2.26.3
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
		 geoclue at-spi2-atk 'libwpe>=1.4.0')
source=('https://webreflection.github.io/aur/wpewebkit-gl-aarch64-2.26.3.tar.gz')
md5sums=('689c75c90f7de0cb033061f8c4e3280b')
sha1sums=('a1d79c7670e02949297f2f6ec83af4b0f40f1571')
sha256sums=('b31e20f0dc2729899f0aa9d98042c408aab507e6b5b640849593a4762ae76239')
sha512sums=('713acae463d27e1bb59cf42c5b552bcbdddce3e716a75e561a2c6817d3cd496fd0157099619967f3a2a0e90b38cab056b5bd78298c2e562184babad286ee8906')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
