# Maintainer: screwy <me@screwy.dev>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rufin-bin
pkgver=0.19.0
pkgrel=1
pkgdesc='Native music player for Jellyfin, Navidrome/OpenSubsonic, Plex, and Emby servers;  local folders,  WebDAV including a direct Nextcloud browser login path, Samba and NAS shares.'
arch=('x86_64')
url='https://github.com/rufin-app/rufin'
license=('GPL-3.0-or-later')
depends=(
  'libgcc_s.so'
  'glib2'
  'glibc'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
)
provides=("rufin=${pkgver}")
conflicts=('rufin')
options=('!strip' '!debug')
source_x86_64=("https://github.com/rufin-app/rufin/releases/download/v0.19.0/rufin-0.19.0-archlinux-x86_64.tar.zst")
sha256sums_x86_64=('8c28e757f5992c2d29138d48d2f1abd0e88de361d5d3c7594cddc43280c7567c')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
