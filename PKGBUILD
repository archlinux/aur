# Maintainer: screwy <screwygit@proton.me>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rufin-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='Native GTK4/libadwaita music player for Jellyfin, Subsonic, Navidrome and local libraries written in Rust'
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
source_x86_64=("https://github.com/screwys/Rufin/releases/download/v0.14.0/rufin-0.14.0-archlinux-x86_64.tar.zst")
sha256sums_x86_64=('abab6da3ed062917c6632afe7eb7148e221de2f94e6e73876f32e4b23bc5018e')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
