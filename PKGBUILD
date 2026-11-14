# Maintainer: agony <27015 at riseup dot net>

pkgname=keep-sorted-bin
pkgver=0.11.0
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
sha256sums_x86_64=('52b9e740287770ced338de09473b8e80dabc4617f220789f01997a5f8c1dfd7e')
sha256sums_aarch64=('ce56c5e0599377fb110bb67314c23b60e269e64eb9b8cd44121d9c396dccc1d9')

package() {
  install -Dm755 "keep-sorted-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/keep-sorted"
}
