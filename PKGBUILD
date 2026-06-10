# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-bin"
pkgver=26.6.2
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
sha256sums=('44f491755d074b065faa2ff289ad2cc5124e8fc88a2c1b97b12e916539182027')

package() {
	install -d "${pkgdir}/usr"
	cp -a --no-preserve=ownership "${srcdir}/${_archive}/usr/." "${pkgdir}/usr/"
}
