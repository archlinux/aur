# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=webkit2gtk-wpe-bin
pkgver=2.32.1
pkgrel=1
arch=(aarch64 armv7h armv7l x86_64)
pkgdesc='Web content engine for GTK (WPE Render)'
url='https://webkitgtk.org'
license=(custom)
provides=('webkit2gtk' 'webkit2gtk-git' 'libjavascriptcoregtk-4.0.so' 'libwebkit2gtk-4.0.so')
conflicts=('webkit2gtk' 'webkit2gtk-git' 'libjavascriptcoregtk-4.0.so' 'libwebkit2gtk-4.0.so')
depends=(cairo fontconfig freetype2 glib2 harfbuzz harfbuzz-icu icu libjpeg
         libepoxy libgcrypt libsoup libxml2 zlib libpng sqlite libwebp
         atk at-spi2-core openjpeg2 woff2 libtasn1 libxslt libsystemd bubblewrap
         libegl libgl libgles libwpe libx11 libxext libice libxt libavif
         libseccomp xdg-dbus-proxy gstreamer gst-plugins-base-libs libxkbcommon
         wayland wpebackend-fdo hyphen libnotify gtk3 libsecret gst-plugin-wpe
         enchant libmanette)
optdepends=('geoclue: Geolocation support'
            'gst-plugins-good: media decoding'
            'gst-plugins-bad: media decoding'
            'gst-libav: nonfree media decoding')
source_aarch64=('webkit2gtk-wpe-bin-aarch64::https://webreflection.github.io/aur/webkit2gtk-wpe-bin-aarch64-2.32.1.tar.gz')
source_armv7h=('webkit2gtk-wpe-bin-armv7h::https://webreflection.github.io/aur/webkit2gtk-wpe-bin-armv7l-2.32.1.tar.gz')
source_armv7l=('webkit2gtk-wpe-bin-armv7l::https://webreflection.github.io/aur/webkit2gtk-wpe-bin-armv7l-2.32.1.tar.gz')
source_x86_64=('webkit2gtk-wpe-bin-x86::https://webreflection.github.io/aur/webkit2gtk-wpe-bin-x86_64-2.32.1.tar.gz')

sha256sums_aarch64=('fef1e009bb50dbdeed8a5ce038970776b4eb2b7e428ffdf518ef52ab262f12e8')
sha256sums_armv7l=('67c32456a3a4951c8a5ff3e6d10a7c39aa51f670a8f6c27a5561871b97180919')
sha256sums_armv7h=('67c32456a3a4951c8a5ff3e6d10a7c39aa51f670a8f6c27a5561871b97180919')
sha256sums_x86_64=('38c971cb4af94677a0511baef320ba9307450133ae8257a317e386793171d757')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

