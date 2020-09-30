# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-aarch64
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-aarch64-2.30.1.tar.gz')
md5sums=('1a570f31a49537573221c6f96a4d5c7c')
sha1sums=('b6cd2f6fd83157a3954777249c81e5448395715b')
sha256sums=('735fe9d67a4a5c850a2a77c14f5085e10d26440b61076cb9256cc280da7c3a83')
sha512sums=('cce58fa5b56d54cfa69f520f5a398472d73be5b85ba0352b24be11ebdb596552b48fa7c7d269c078cf765f6ef9b8af9eca740d495918fc39dd3b9dec51961713')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
