# SPDX-License-Identifier: 0BSD
pkgname=sdat-bin
pkgver=2.4.1
pkgrel=1
pkgdesc='Unofficial native GTK4 / Adwaita music streaming client for TIDAL'
arch=('x86_64')
url='https://github.com/Nichokas/SDAT'
license=('GPL-3.0-or-later')
depends=('dconf' 'glib-networking' 'glib2' 'glibc' 'graphene' 'gst-plugins-bad'
         'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good'
         'gstreamer' 'gtk4' 'hicolor-icon-theme' 'libadwaita' 'libgcc'
         'libsecret')
optdepends=('gnome-keyring: Secret Service for storing TIDAL credentials'
            'gst-libav: additional audio codecs')
provides=("sdat-desktop=$pkgver")
conflicts=('sdat-desktop' 'tonearm')
options=('!strip' '!debug')
source=("$url/releases/download/desktop-v$pkgver/sdat-desktop-$pkgver-arch-x86_64.tar.zst")
sha256sums=('eeafb1fadcef7f54022d19c4888b3c440df924cf4e758f6930c4698aa077a72b')

package() {
    cp -a -- "$srcdir/usr" "$pkgdir/"
}
