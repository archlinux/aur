# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-bin"
pkgver=26.7.3
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
  'glycin'
  'gtk4')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsukinaha/tsukimi/releases/download/v${pkgver}/tsukimi-amd64-linux.tar.gz")
sha256sums=('ca4e6efc4a4205c17e92c75697355ed8e293e76138d05d83b0323b99116cd495')

package() {
  install -d "${pkgdir}/usr"
  cp -a --no-preserve=ownership "${srcdir}/${_archive}/usr/." "${pkgdir}/usr/"
}
