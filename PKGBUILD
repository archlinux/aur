# Maintainer: Bagel Jr <aryanagarwal897 at gmail dot com>
# Contributor: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=btdu-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='sampling disk usage profiler for btrfs'
arch=('x86_64' 'aarch64')
url='https://github.com/CyberShadow/btdu'
license=('GPL2')
depends=('ncurses')
conflicts=('btdu')
# these should match dub.selections.json
_d_ae_ver=0.0.3100
_d_btrfs_ver=0.0.12
_d_ncurses_ver=0.0.149
_d_emsi_containers_ver=0.9.0
source_x86_64=(${pkgname}::https://github.com/CyberShadow/btdu/releases/download/v$pkgver/btdu-static-x86_64)
source_aarch64=(${pkgname}::https://github.com/CyberShadow/btdu/releases/download/v$pkgver/btdu-glibc-aarch64)
sha256sums_aarch64=(6704b26887cc49c8cbe10d1e685f78541ee162b8d6b223005195c0a67201fc5d)
sha256sums_x86_64=(02b26b3f694d3a6fea9f095d1154052a847b1988438e7ea15508caf967ed2d5b)
package() {
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/btdu"
}

