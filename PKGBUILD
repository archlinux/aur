# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-armv7l
pkgver=2.26.2
arch=(armv7l)
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices (gl version)'
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
provides=('wpewebkit')
conflicts=('wpewebkit')
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 'libwpe>=1.0.0')
source=('https://webreflection.github.io/aur/wpewebkit-gl-armv7l-2.26.2.tar.gz')
md5sums=('41efcde911030206eb6cdce9a8285c68')
sha1sums=('065ccfa98a7a7df1fefeef09299e62fc82b670fe')
sha256sums=('15c8cd766367f838ae29e8de2ee11d3b137b5d5b6ebf0962cb5be75936867faf')
sha512sums=('f87686b1f06c5178da85e814b515fa352a3ce5b2ae687cf3708f4c724a565071c00fa4628cb0045801e20cd10440b984e04c9cf122feff6d0476c4054d58451e')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
