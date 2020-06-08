# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-armv7l
pkgver=2.28.2
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-armv7l-2.28.2.tar.gz')
md5sums=('fcdd8ce180be926c48cace9fd9c8d492')
sha1sums=('9b556f955dab1d09f0ba0355da917e98068e486a')
sha256sums=('9a5119879760edc73e35421f0e4c8d8097036cdb4fbfc057f4b9d806dac38887')
sha512sums=('c81001bbffaa6771e9c5664834cc81e567911f2583ee3548ccd13268082bdc6ac6a5877bfdf7daf97a603c8e898763dca19cded6d0f867580cede569859da228')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
