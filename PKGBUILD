# Maintainer: winlu <derwinlu@gmail.com>

pkgname=minio-mc-bin
_srcname=minio-mc
pkgver=2019_08_21T19_59_10Z
pkgrel=1
pkgdesc="Minio client, binary version"
url="https://min.io"
license=('Apache 2.0')
arch=('x86_64')

source_x86_64=("mc::https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.RELEASE.${pkgver//_/-}")
sha256sums_x86_64=('eff0b8cdcc93c0eb4bb6dd11810f2150944458fd5e6fba7b7ca40200d1b7ff31')


package() {
    install -Dm755 "$srcdir/mc" "$pkgdir/usr/bin/mc"
}
