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
md5sums=('5b835e9b6829133e1531775b3016d6b1')
sha1sums=('3aa955cfc013326d54ca269d0a3dfeb4862a47ee')
sha256sums=('4bc2d34001678b8658d906e51633964683ec7ee08d8aafee133239699f3f3953')
sha512sums=('191074e16d8edd95d365d7dac385062aa80063dfb64f0c349e7ac3ef373ff022c8d2127ef73f3327a79bf293cafe9619e3dd4e1c73c5d527ab8b71792b293dd0')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
