# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-bin"
pkgver=26.7.2
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
sha256sums=('d41175e97f5b65f061d5aeb4e0c5aadf631f56bb123965a140b1c2c3e519fff5')

package() {
  install -d "${pkgdir}/usr"
  cp -a --no-preserve=ownership "${srcdir}/${_archive}/usr/." "${pkgdir}/usr/"
}
