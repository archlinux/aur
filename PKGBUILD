# Maintainer: zaidejjo <zaid@ejjo.me>
# Contributor: zaidejjo <zaid@ejjo.me>
# shellcheck shell=bash

pkgname=zgit-bin
pkgver=0.2.0
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
sha256sums=('19a35ce73e084d60209bbd97a2e54229c3debf8c29b540df5ec3f1f367dc023a')

package() {
  install -Dm755 "zgit-v${pkgver}-linux-amd64/zgit" "${pkgdir}/usr/bin/zgit"
}

# vim:set ts=2 sw=2 et:
