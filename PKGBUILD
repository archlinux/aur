# Maintainer: screwy <screwygit@proton.me>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rufin-bin
pkgver=0.16.5
pkgrel=1
pkgdesc='Native music player for Jellyfin, Navidrome/OpenSubsonic, Plex, and Emby servers;  local folders,  WebDAV including a direct Nextcloud browser login path, Samba and NAS shares.'
arch=('x86_64')
url='https://github.com/screwys/Rufin'
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
conflicts=('rufin' 'rufin-git')
replaces=('rufin')
options=('!strip' '!debug')
source_x86_64=("https://github.com/screwys/Rufin/releases/download/v0.16.5/rufin-0.16.5-archlinux-x86_64.tar.zst")
sha256sums_x86_64=('c232a58740135642363bc0a6c6821e635896c5c6b443be088d8c468ac6bc0b38')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
