# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-armv7l
pkgver=2.28.0
arch=(armv7l)
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices (gl version)'
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
provides=('wpewebkit' 'wpewebkit-git')
conflicts=('wpewebkit' 'wpewebkit-git')
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 'libwpe>=1.0.0')
source=('https://webreflection.github.io/aur/wpewebkit-gl-armv7l-2.28.0.tar.gz')
md5sums=('d92d0859a55bf4dc7033b0268865ecb3')
sha1sums=('b6ffe4002e240912b7ab1b67a92b0e1ed7a1f21e')
sha256sums=('fcd54a1ae61dca8f63954c4563353ee2da1118a0dac03ae6805a994167098899')
sha512sums=('6e12940158547e4253a95285ccba97d14e76098661f861a12bc6506a9676625bb0f5ed4d724c737897795a3568302673efa2ac4b44ae6630231d4ac97c1375aa')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
