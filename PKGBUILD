# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-armv7l
pkgver=2.28.0
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-armv7l-2.28.0.tar.gz')
md5sums=('573d1fbc5562a45c155654534869a96e')
sha1sums=('b4c449306466fe0d57aadd56dd03ff8d50271045')
sha256sums=('165d610a6285e425535593d298463c8a557bf3eff586abdfcd4b9a9f2ff0ab12')
sha512sums=('d1f8d8f4f15e712541a0af2bc528e11b12dc71a9079f77fb7b942624e037c972740ca99c85af01630497babd3692503146084b083e708d0c1714d5fbddb03ece')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
