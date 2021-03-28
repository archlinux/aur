# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-bin
pkgver=2.32.0
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices (binary version)'
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
provides=('wpewebkit' 'wpewebkit-git')
conflicts=('wpewebkit' 'wpewebkit-git')
depends=(cairo fontconfig freetype2 glib2 harfbuzz harfbuzz-icu icu libjpeg
         libepoxy libgcrypt libsoup libxml2 zlib libpng sqlite libwebp libwpe
         atk at-spi2-atk openjpeg2 woff2 libtasn1 libxslt libsystemd bubblewrap
         libseccomp xdg-dbus-proxy gstreamer gst-plugins-base-libs libxkbcommon
         wayland wpebackend-fdo)
optdepends=('geoclue: Geolocation support'
            'gst-plugins-good: media decoding'
            'gst-plugins-bad: media decoding'
            'gst-libav: nonfree media decoding')
source_aarch64=('wpewebkit-bin-aarch64::https://webreflection.github.io/aur/wpewebkit-bin-aarch64-2.32.0.tar.gz')
source_armv7h=('wpewebkit-bin-armv7h::https://webreflection.github.io/aur/wpewebkit-bin-armv7l-2.32.0.tar.gz')
source_armv7l=('wpewebkit-bin-armv7l::https://webreflection.github.io/aur/wpewebkit-bin-armv7l-2.32.0.tar.gz')
source_x86_64=('wpewebkit-bin-x86::https://webreflection.github.io/aur/wpewebkit-bin-x86_64-2.32.0.tar.gz')

sha256sums_aarch64=('a467cc34755454f3d032f55f54459fb59c322a191e4ab6fdc3f1c3fbfdebff5e')
sha256sums_armv7l=('d742580e22b7249562e9e48971e735da0d1206e823b6a1f9bcb8953b45c62592')
sha256sums_armv7h=('d742580e22b7249562e9e48971e735da0d1206e823b6a1f9bcb8953b45c62592')
sha256sums_x86_64=('c96b0b5e2b2706ba9f4e65154c38f42c5485c1a874d7a2f81ce84934c6736aa6')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

