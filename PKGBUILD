#Maintainer: Jamie Steven (gritty.water0696@fastmail.com)
_name=pixlet
pkgname=${_name}-bin
pkgver=0.24.3
pkgrel=1
arch=("x86_64" "aarch64")
pkgdesc='Build apps for pixel-based displays'
url="https://github.com/tidbyt/pixlet"
license=(APACHE)
provides=("${_name}")

source_x86_64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/tidbyt/pixlet/releases/download/v${pkgver}/pixlet_${pkgver}_linux_arm64.tar.gz")

sha1sums_x86_64=('8c0c2eb1cce2bb0d4f6cd79ea3b9f8c920d194d3')
sha1sums_aarch64=('22a5d11d8d204f2f985a5b2b9ade404393d1cc1f')

package() {
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
