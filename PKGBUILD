# Maintainer: bko <aur at bil dot co dot ua>
pkgname=s3sync
pkgver=1.56.1
pkgrel=1
pkgdesc="Reliable, flexible, and fast synchronization tool for S3"
arch=('x86_64' 'aarch64')
url="https://github.com/nidor1998/s3sync"
license=('Apache-2.0')
depends=('glibc')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nidor1998/s3sync/releases/download/v${pkgver}/s3sync-${pkgver}-linux-glibc2.28-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nidor1998/s3sync/releases/download/v${pkgver}/s3sync-${pkgver}-linux-glibc2.28-aarch64.tar.gz")

sha256sums_x86_64=('6540376ab3566ad57b963c97274bd42381a66603f62b3e0c07c6504bddb4359d')
sha256sums_aarch64=('cb139d617070bc0ef693a9df882d0e52685189253bec35712beaa41508e639b5')

package() {
    install -Dm755 s3sync "${pkgdir}/usr/bin/s3sync"
}
