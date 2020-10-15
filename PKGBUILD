# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-bin
pkgver=2.30.1
arch=(aarch64 armv7h armv7l x86_64)
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
source_aarch64=('wpewebkit-bin-aarch64::https://webreflection.github.io/aur/wpewebkit-bin-aarch64-2.30.1.tar.gz')
source_armv7h=('wpewebkit-bin-armv7h::https://webreflection.github.io/aur/wpewebkit-bin-armv7l-2.30.1.tar.gz')
source_armv7l=('wpewebkit-bin-armv7l::https://webreflection.github.io/aur/wpewebkit-bin-armv7l-2.30.1.tar.gz')
source_x86_64=('wpewebkit-bin-x86::https://webreflection.github.io/aur/wpewebkit-bin-x86_64-2.30.1.tar.gz')

sha256sums_aarch64=('ba1902ad06eb8cf1471a8249addb68c9db1fc5640490a754379dcb9acf091241')
sha256sums_armv7l=('76a52f5812d6367db7fa69844fadf78a51364fd91947f01434302d0fd28cf764')
sha256sums_armv7h=('76a52f5812d6367db7fa69844fadf78a51364fd91947f01434302d0fd28cf764')
sha256sums_x86_64=('1e6373dbdaa086a2650bb558eda01fc4e0985daaf38eea098e9dbe7423c09b37')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

