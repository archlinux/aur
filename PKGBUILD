# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-x86_64
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-x86_64-2.30.1.tar.gz')
md5sums=('817952d4b407eacab3a720cc96865252')
sha1sums=('4484f5af50373674157ef56479218fc663f76925')
sha256sums=('ec683af055c4b9878fad4e0677173934575446136f8e6d61fe1376a169ee570d')
sha512sums=('c68e0ae3f939b66a0c6e37cc568fb25bb71c2c1e6ac4d7aafb345b76e756a1301951f67c96002b1e107a23c5ea6d167cdbd833896a92a1c6f69a2d5450c5b9d6')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
