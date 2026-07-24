# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=gnome-network-displays-bin
pkgver=0.99.0
pkgrel=1
pkgdesc="Screencasting for GNOME - Miracast and Chromecast (prebuilt)"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL-3.0-or-later')
depends=('avahi' 'dnsmasq' 'gst-plugin-pipewire' 'gst-plugins-bad'
         'gst-plugins-good' 'gst-plugins-ugly' 'gst-rtsp-server' 'gstreamer'
         'gtk4' 'json-glib' 'libadwaita' 'libnm' 'libportal' 'libportal-gtk4'
         'libpulse' 'libsoup3' 'networkmanager' 'protobuf-c'
         'xdg-desktop-portal' 'hicolor-icon-theme')
optdepends=('gstreamer-vaapi: hardware accelerated encoding')
provides=('gnome-network-displays')
conflicts=('gnome-network-displays')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('6e7f93f491226bab6ae54139dcaf009d9cedd8e983b04b5128701c3250936ac1')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
