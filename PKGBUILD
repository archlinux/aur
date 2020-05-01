# Maintainer: winlu <derwinlu@gmail.com>

pkgname=minio-mc-bin
_srcname=minio-mc
pkgver=2020_04_25T00_43_23Z
pkgrel=1
pkgdesc="Minio client, binary version"
url="https://min.io"
license=('Apache 2.0')
arch=('x86_64' 'aarch64')

source_x86_64=("mc_x86_64::https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.RELEASE.${pkgver//_/-}")
source_aarch64=("mc_aarch64::https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.RELEASE.${pkgver//_/-}")
sha256sums_x86_64=('fc0a1d3dcce6d6c30f01e2a72d6b6df062965e4832951dd1c1d2dca59a055a95')
sha256sums_aarch64=('bd0632ac5099de4b5356a29d3ff2b1d38d860342ecc4ea39240067a0795ba962')


package() {
    install -Dm755 "$srcdir/mc_$CARCH" "$pkgdir/usr/bin/mc"
}
