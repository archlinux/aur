# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-armv7l
pkgver=2.28.3
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-armv7l-2.28.3.tar.gz')
md5sums=('7a34933267d653de67607f3d72323457')
sha1sums=('3d2fea637983738cdbe1f51f6557b3503be40dc1')
sha256sums=('861ce35537eae41d4d6a250db0ad88488c2ab7bb47c4cd61f3f325675789914d')
sha512sums=('2d39fb86ada97517f69923597e7085b3760278256292a2a1afbcbe1b96bb83c11a6ac57c5f4ea836a484a21323ce9ff1bae1766a4d55fe304d04e433b4957f8a')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
