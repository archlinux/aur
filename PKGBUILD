# Maintainer: screwy <me@screwy.dev>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rufin-bin
pkgver=0.20.0
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
source_x86_64=("https://github.com/rufin-app/rufin/releases/download/v0.20.0/rufin-0.20.0-archlinux-x86_64.tar.zst")
sha256sums_x86_64=('08ed3a0c3cab85c85851d274777e7677aa1ee69bd8d131dfb064dd37c232288b')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
