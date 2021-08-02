# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-bin
pkgver=2.32.3
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices (binary version)'
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
provides=('wpewebkit' 'wpewebkit-git')
conflicts=('wpewebkit' 'wpewebkit-git')
depends=(cairo fontconfig freetype2 glib2 harfbuzz harfbuzz-icu icu libjpeg libavif
         libepoxy libgcrypt libsoup libxml2 zlib libpng sqlite libwebp libwpe
         atk at-spi2-atk openjpeg2 woff2 libtasn1 libxslt libsystemd bubblewrap
         libseccomp xdg-dbus-proxy gstreamer gst-plugins-base-libs libxkbcommon
         wayland wpebackend-fdo)
optdepends=('geoclue: Geolocation support'
            'gst-plugins-good: media decoding'
            'gst-plugins-bad: media decoding'
            'gst-libav: nonfree media decoding')
source_aarch64=('wpewebkit-bin-aarch64::https://webreflection.github.io/aur/wpewebkit-bin-aarch64-2.32.3.tar.gz')
source_armv7h=('wpewebkit-bin-armv7h::https://webreflection.github.io/aur/wpewebkit-bin-armv7l-2.32.3.tar.gz')
source_armv7l=('wpewebkit-bin-armv7l::https://webreflection.github.io/aur/wpewebkit-bin-armv7l-2.32.3.tar.gz')
source_x86_64=('wpewebkit-bin-x86::https://webreflection.github.io/aur/wpewebkit-bin-x86_64-2.32.3.tar.gz')

sha256sums_aarch64=('4c55cae040c23191288bbfb27cda20c3b336a5ebca749115b1e00adc8dbba30b')
sha256sums_armv7l=('b69aebdfe5e9bd3600cf4ade459e6a86eeb19ad71eb835744cea8a525298f9d5')
sha256sums_armv7h=('b69aebdfe5e9bd3600cf4ade459e6a86eeb19ad71eb835744cea8a525298f9d5')
sha256sums_x86_64=('57733ff72a78a3d3ea6cbc88b87ac102ad88939b96738bf5f918965e7ad8397a')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

