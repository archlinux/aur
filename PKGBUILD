# Maintainer: screwy <screwygit@proton.me>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rufin-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='Native music player for Jellyfin, Navidrome/OpenSubsonic, Plex, and Emby servers;  local folders,  WebDAV including a direct Nextcloud browser login path, Samba and NAS shares.'
arch=('x86_64')
url='https://github.com/screwys/Rufin'
license=('GPL-3.0-or-later')
# Generated Linux package dependencies start.
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
# Generated Linux package dependencies end.
provides=("rufin=${pkgver}")
conflicts=('rufin' 'rufin-git')
replaces=('rufin')
options=('!strip' '!debug')
source_x86_64=("https://github.com/screwys/Rufin/releases/download/v0.15.1/rufin-0.15.1-archlinux-x86_64.tar.zst")
sha256sums_x86_64=('9cad17e6af85ae17e4bf5fa61bd5ee5dc7a92c2d0bd4ee58bfc4b2c75223665b')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
