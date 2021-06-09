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

sha256sums_aarch64=('174db6ad81163e3c63f38218d1e6065b10511b89aeefac5ee3b4bfdb8cc83ca9')
sha256sums_armv7l=('2fc2c5a4285513226b6458455376df44da9294d76fecd2d9462a8463751a193e')
sha256sums_armv7h=('2fc2c5a4285513226b6458455376df44da9294d76fecd2d9462a8463751a193e')
sha256sums_x86_64=('06d97cac9e6de859b9ad945c850324abbdb54b7699fe91998da26716ee079ede')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

