# Maintainer: zaidejjo <zaid@ejjo.me>
# Contributor: zaidejjo <zaid@ejjo.me>
# shellcheck shell=bash

pkgname=zgit-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern, fast Git & GitHub client — TUI binary"
arch=('x86_64')
url="https://github.com/zaidejjo/zgit"
license=('Apache')
depends=('git' 'glibc')
makedepends=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/zgit-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('3ae45d50fe2f24a5f7a60f14fc873da96341b0b34483f3bd8d6ff082db68091a')

package() {
  install -Dm755 "zgit-v${pkgver}-linux-amd64/zgit" "${pkgdir}/usr/bin/zgit"
}

# vim:set ts=2 sw=2 et:
