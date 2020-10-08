# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-x86_64
pkgver=2.30.1
arch=(armv7l armv7h)
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-x86_64-2.30.1.tar.gz')
md5sums=('e70e973d88d19c31e8791febb52077cd')
sha1sums=('e64a866e63527d542d4286731e19aa413ac624e0')
sha256sums=('780d161aab1125e1767dd881e58f88546b7262b66c3bc5a5f838d3e9d82933a0')
sha512sums=('330cc00b6556f071ee4ab576b8e0688bc984de6f6faad1b6594ae23d5021f1f89b2844a47f090d51fac6a09643cc97d6b4034f3d8b94e86d46c2e15c0497a82b')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
