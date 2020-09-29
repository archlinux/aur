# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-aarch64
pkgver=2.28.3
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-aarch64-2.28.3.tar.gz')
md5sums=('02b968a8ea7576141dc7d859a45386ad')
sha1sums=('abdef8456a7afc12da730f5404d8a7af04f5236f')
sha256sums=('1a48366e48cba1681399fd75ca453f4d2e37fa0960da591d23552c2f65be0b5f')
sha512sums=('782e0180f55646a24f1bb7158e73ed95e43055658f4bdc28bfbe3f02da6da52a280be8c916d29a3400350b6ad2514f4c0dff61133eb9ad51afc13734d52119d7')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
