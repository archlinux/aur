# Maintainer: Rin Leaf <tiflew123 at gmail dot com>
pkgname=sftool-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="CLI version of sftool, a download tool for the SiFli family of chips"
arch=('x86_64' 'aarch64')
conflicts=('sftool-gui-bin')
url="https://github.com/OpenSiFli/sftool"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'libcap'
  'systemd-libs'
)
makedepends+=(
	"libarchive"
)
options=('!strip' '!emptydirs')
source_x86_64=("${url}/releases/download/${pkgver}/sftool-${pkgver}-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/${pkgver}/sftool-${pkgver}-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('231ec30a5a16edbac9b786d1a109cbcf9d6dd0fd7d93443c6438c2a12fe8ec56')
sha256sums_aarch64=('81981e262b63e3e2ca8dbf2a6888dc9a29954d7e23b58aa6ec5acf00dd2b6e6f')

function package() {
  install -Dm755 sftool "${pkgdir}/usr/bin/sftool"
}

