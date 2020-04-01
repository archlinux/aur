# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-aarch64
pkgver=2.28.0
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-aarch64-2.28.0.tar.gz')
md5sums=('7af01ad1f249b305da4c9cccb149ae93')
sha1sums=('994eda9e0dbc28be7c2cc60b362a61c1bd03db38')
sha256sums=('c71dd9e254bda25c072554af7e9535e877581959e2ff166cc097e2a6ead5237a')
sha512sums=('8a6538794dfe76feef1e0b1cb8239f68c381b1d2c80a0ca389fa264eca71bc63505c370a438745a83c67ba43ef368fab2d76671e30f4450cddba290f4c08cef9')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
