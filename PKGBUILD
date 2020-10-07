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
md5sums=('7f657578b2453fee78053aa282a4819f')
sha1sums=('6a65443df4ca476ae73f0abb400ce362aaf6dcb3')
sha256sums=('e1d0a96ca134aee65dd0d381f22c299b6e2dd4d0230043d923215664d974f14b')
sha512sums=('ab1c7e4476a711460c494d5c60fbba5fd4589dd4833a79f38749dd7bafd2f5d18d5bd8c450cc035f4050d3b908daf06bd5378c6226fd832d44947d4403b07b6c')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
