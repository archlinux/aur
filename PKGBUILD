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
md5sums=('7ad595602351a2644d44f3e6435f53b6')
sha1sums=('61988c831ce0ef248eb3487459a34de28ebfc9bb')
sha256sums=('3a0c116c7fcad97f1c9463f6a80424ba5eba31fa7d7cf2a0667a0ec255e72c2b')
sha512sums=('eac206ce013a3889fbc0fa2951d610fc972c2f4de42d2e5b37d883f4f545b15696f53fa7210a8ac16651d52b816178f5c6db3f629ed7cd33702096fdd0c5a82c')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
