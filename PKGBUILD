# Maintainer: zaidejjo <zaid@ejjo.me>
# Contributor: zaidejjo <zaid@ejjo.me>
# shellcheck shell=bash

pkgname=zgit-bin
pkgver=0.1.2
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
sha256sums=('a575c1dd2a5d369c40c4490d54c368ab35175ecb16ee2cc0768c47f59c422a7a')

package() {
  install -Dm755 "zgit-v${pkgver}-linux-amd64/zgit" "${pkgdir}/usr/bin/zgit"
}

# vim:set ts=2 sw=2 et:
