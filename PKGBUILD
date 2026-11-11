# Maintainer: agony <27015 at riseup dot net>

pkgname=keep-sorted-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='Language-agnostic formatter that sorts lines between two markers in a larger file (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/google/keep-sorted'
license=('Apache-2.0')
provides=("keep-sorted=${pkgver}")
conflicts=('keep-sorted')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("keep-sorted-${pkgver}-x86_64::${_release}/keep-sorted_linux_amd64")
source_aarch64=("keep-sorted-${pkgver}-aarch64::${_release}/keep-sorted_linux_arm64")
sha256sums_x86_64=('079710c01619cc3dc11c9ddce18ac8db8d86701e7d12f9c5b62b8c4c4a664cca')
sha256sums_aarch64=('fcb5543fcacaef8edd092f34182f137838e042125812ef0a22035e10f6698577')

package() {
  install -Dm755 "keep-sorted-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/keep-sorted"
}
