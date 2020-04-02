# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=webkit2gtk-glesv2-armv7l
pkgver=2.28.0
arch=(armv7l armv7h)
pkgrel=1
pkgdesc='GTK+ Web content engine library (glesv2 version)'
url='https://webkitgtk.org'
license=(custom)
provides=('webkit2gtk' 'webkit2gtk-git')
conflicts=('webkit2gtk' 'webkit2gtk-git')
depends=(libxt libxslt enchant gst-plugins-base-libs libsecret libwebp openjpeg2
         harfbuzz-icu gtk3 libnotify hyphen woff2 libwpe wpebackend-fdo
         bubblewrap xdg-dbus-proxy)
makedepends=(gperf gobject-introspection ruby gtk-doc cmake python geoclue
             gst-plugins-bad)
optdepends=('geoclue: Geolocation support'
            'gst-plugins-good: media decoding'
            'gst-plugins-bad: media decoding'
            'gst-libav: nonfree media decoding')
source=('https://webreflection.github.io/aur/webkit2gtk-glesv2-armv7l-2.28.0.tar.gz')
md5sums=('67036536e220dbf0c230b9e25a4c7015')
sha1sums=('1e69fd1ca7f152ac53ed98ea91b17adb17dce4f8')
sha256sums=('162f92afce8459284a57b6ccd5ac8b5cfc5bd8c3f346b0556c004cb89264283a')
sha512sums=('17c51912aa5a84b6e2867cf243772a844aa8fa5deb21f54901df19e3ed50149cbc23ae7503a0cbedd862af243bf30ea592a4c26805b2510a70cba29e119bc17d')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
