# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-bin"
pkgver=26.7.1
pkgrel=1
pkgdesc='A simple third-party Jellyfin client for Linux'
arch=('x86_64')
url="https://github.com/tsukinaha/tsukimi"
license=('GPL-3.0-or-later')
provides=('tsukimi')
conflicts=('tsukimi-git')
_archive="${_pkgname}-amd64-linux"
depends=(
  'mpv'
  'ffmpeg'
  'libadwaita'
  'gstreamer'
  'gtk4')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsukinaha/tsukimi/releases/download/v${pkgver}/tsukimi-amd64-linux.tar.gz")
sha256sums=('4309e82e76c0e8f1455e99c8e3b453368afaac3c9decfd4b376c8c22f99bb560')

package() {
  install -d "${pkgdir}/usr"
  cp -a --no-preserve=ownership "${srcdir}/${_archive}/usr/." "${pkgdir}/usr/"
}
