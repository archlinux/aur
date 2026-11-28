# SPDX-License-Identifier: 0BSD
pkgname=sdat-bin
pkgver=2.5.0
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
sha256sums=('5e8adee91e96f685ac10a46620aba295dae86bc5885dd3a76aa400d3ef947f44')

package() {
    cp -a -- "$srcdir/usr" "$pkgdir/"
}
