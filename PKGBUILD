# Maintainer: screwy <screwygit@proton.me>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rufin-bin
pkgver=0.11.1
pkgrel=1
pkgdesc='Native GTK4/libadwaita music client for Jellyfin, Subsonic, Navidrome and local libraries written in Rust'
arch=('x86_64')
url='https://github.com/screwys/Rufin'
license=('GPL-3.0-or-later' 'NAIST-2003')
# Generated Linux package dependencies start.
depends=(
  'gcc-libs'
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
source_x86_64=("https://github.com/screwys/Rufin/releases/download/v0.11.1/rufin-0.11.1-archlinux-x86_64.tar.zst")
sha256sums_x86_64=('e9f9c71e5c265e339aee527690de1de5e9919d7fec74a3d2d62c064b78a9576b')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
