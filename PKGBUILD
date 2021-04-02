# Maintainer: winlu <derwinlu+aur@gmail.com>

pkgname=minio-mc-bin
_srcname=minio-mc
pkgver=2021_03_23T05_46_11Z
pkgrel=1
pkgdesc="Minio client, binary version"
url="https://min.io"
license=('Apache 2.0')
arch=('x86_64' 'aarch64')

source_x86_64=("mc_x86_64::https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.RELEASE.${pkgver//_/-}")
source_aarch64=("mc_aarch64::https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.RELEASE.${pkgver//_/-}")
sha256sums_x86_64=('088efeb053cdb06f8450533452ad0fae859758134a953cb353072236d2abb4ee')
sha256sums_aarch64=('64267cd348ff42af9691063dbb21d0d562bb354710fbf113bffffe2f37b0e9d3')


package() {
    install -Dm755 "$srcdir/mc_$CARCH" "$pkgdir/usr/bin/mcli"
}
