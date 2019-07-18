# Maintainer: winlu <derwinlu@gmail.com>

pkgname=minio-mc-bin
_srcname=minio-mc
pkgver=2019_07_17T22_13_42Z
pkgrel=1
pkgdesc="Minio client, binary version"
url="https://min.io"
license=('Apache 2.0')
arch=('x86_64')

source_x86_64=("mc::https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.RELEASE.${pkgver//_/-}")
sha256sums_x86_64=('9104939a730081c6ef87417fa1457fa3d34010ed530ccd9a0ec494a91fb6f7fe')


package() {
    install -Dm755 "$srcdir/mc" "$pkgdir/usr/bin/mc"
}
