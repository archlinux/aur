# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-bin-armv7l
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
source=('https://webreflection.github.io/aur/wpewebkit-bin-armv7l-2.30.1.tar.gz')
md5sums=('704300bcfed2adbe3b2dd1c02b0187d5')
sha1sums=('1792f329f951064d98c188a2762691d1d489a354')
sha256sums=('800a4833ec2acb86a2d44b6491953395aa6c836ef3ff2db4bcb40fbac887925a')
sha512sums=('48419a3b5df0f5762a966765150ea3767d9d09ea60bd0b2333e05589e71bce92176f24579905aea37512ff664fb3093fef168bf32ff1430d21bf30da0678d4bd')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
