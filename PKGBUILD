# Maintainer: fullarnoldostupi

pkgname=redpwnpow-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A non-parallelizable proof of work challenge system"
arch=('x86_64' 'aarch64')
url="https://github.com/redpwn/pow"
license=('BSD-3-Clause')
provides=('redpwnpow')
conflicts=('redpwnpow')
source_x86_64=("redpwnpow-${pkgver}-${CARCH}::https://github.com/redpwn/pow/releases/download/v${pkgver}/redpwnpow-linux-amd64")
source_aarch64=("redpwnpow-${pkgver}-${CARCH}::https://github.com/redpwn/pow/releases/download/v${pkgver}/redpwnpow-linux-arm64")
sha256sums_x86_64=('c7ac923013e7a1763fd350692cc7d907ba98c5aa731a030dfec596371b50fe36')
sha256sums_aarch64=('97a386e537144b340971377cbbe5f8fe7ea27ae8f9fe26bd339282dbce66b6d4')

package() {
  install -Dm755 "${srcdir}/redpwnpow-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/redpwnpow"
}
