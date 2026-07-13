# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=ferrumc-bin
pkgver=null
pkgrel=1
pkgdesc="A reimplementation of the Minecraft server in Rust (precompiled binary)"
url="https://github.com/ferrumc-rs/ferrumc"
arch=("x86_64" "aarch64")
provides=("ferrumc")
conflicts=("ferrumc" "ferrumc-git")
license=("MIT")

source_x86_64=("ferrumc-bin-${pkgver}-x86_64.tar.gz::${url}/releases/download/v$(echo ${pkgver} | sed "s/\.\(rc\|beta\|alpha\)/-\1/")/ferrumc-v$(echo ${pkgver} | sed "s/\.\(rc\|beta\|alpha\)/-\1/")-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("ferrumc-bin-${pkgver}-aarch64.tar.gz::${url}/releases/download/v$(echo ${pkgver} | sed "s/\.\(rc\|beta\|alpha\)/-\1/")/ferrumc-v$(echo ${pkgver} | sed "s/\.\(rc\|beta\|alpha\)/-\1/")-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=("SKIP")
sha256sums_aarch64=("SKIP")

package() {
  install -Dm755 "${srcdir}/ferrumc" "${pkgdir}/usr/bin/ferrumc"
}

