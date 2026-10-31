# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-bin"
pkgver=26.11.1
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
sha256sums=('19bfbad9f52b227d8d8ee27008f60055bcffcf577319ed8870d88754fa98e9f2')

package() {
  install -d "${pkgdir}/usr"
  cp -a --no-preserve=ownership "${srcdir}/${_archive}/usr/." "${pkgdir}/usr/"
}
