# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-bin-x86_64
pkgver=2.30.1
arch=(x86_64)
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
source=('https://webreflection.github.io/aur/wpewebkit-bin-x86_64-2.30.1.tar.gz')
md5sums=('2bf45d11d0059a07a0b10b30a7582dc4')
sha1sums=('4ed5bcb1391bf3fd4893ddce6c8d8c5a3ac99bec')
sha256sums=('6e1b1bcfb47d3af8a0aeb05b31881741ac1ee98046ff00cd2fd51b458bdd0291')
sha512sums=('f8364b4cd0381adc084885d1544a7b8958602e5065b9972e5da9d7d245e6ffbfc75bec672dbad094cac07b52961d80a9ef009d320d8e5c9eadba713aa23172d8')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
