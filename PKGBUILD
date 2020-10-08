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
md5sums=('8ba7621b94caf079c6915c885f06b8b5')
sha1sums=('7d6ce514e036f22d0803e049214abd97fc3fe439')
sha256sums=('a61d3f51687864add09546d9561952780deef13a98a2c1d9af80172647fdb613')
sha512sums=('3e5566a308d1c4d0549801343b21e11449083b081e945a7fc264cfd8140d9a5ed9025469dc17a910347670bce71933e5418109bdab861183a30184ead836ebdc')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
