# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-bin-aarch64
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
source=('https://webreflection.github.io/aur/wpewebkit-bin-aarch64-2.30.1.tar.gz')
md5sums=('1814791b455e5160af4892498b0feef6')
sha1sums=('f5fab5e5afe757959a7113e7ff21724786407702')
sha256sums=('82a1004f60bf4a7701eade34abbf7494fd4a3623bd81f1becd22a9350e98ef7b')
sha512sums=('8e514a9e703fe3618a6877754bb0cae77350a75557e657d95b7da01ece5983a7edff0de87f114860bd46d4dc6b3e15a68ea26cad67b902d2ffd6e1594e9af2bf')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
