# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-armv7l
pkgver=2.28.3
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-armv7l-2.28.3.tar.gz')
md5sums=('868d5417199bb933116695b40e32d048')
sha1sums=('18444f85be18fb62c512321f3385dbcec2ee120a')
sha256sums=('eb05b8d6b7ff6e681aa5a63378be2caf221d0b9c6c03483880cb3c034b8eb1fe')
sha512sums=('9688465753db070f8dbeb070d0cda0a9d86cd7df5190c3649be759345468d06fea2e1dc36b142d164ca183647b52735c5e8b65d5d6d409d319d11ae410289c69')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
