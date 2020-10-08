# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-armv7l
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-armv7l-2.30.1.tar.gz')
md5sums=('73eeaee6886285e60b45461145cafa89')
sha1sums=('cb0037a646587606aab1ab04bd8891f0258365e0')
sha256sums=('d144f51d081b52d1f7b700e0c401fe51a1f6ef3a23261d240226f1703b6e8d1b')
sha512sums=('d3441885c3cc1936f7de3c7e1cc8df8fb48c35498af135d20213b3eaa24e3b0ec1787858a284ad1741d081c760a0807c54bf5624bc1c00efe76e08b500aba5d6')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
