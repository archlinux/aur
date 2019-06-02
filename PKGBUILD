# Maintainer: winlu <derwinlu@gmail.com>

pkgname=minio-mc-bin
_srcname=minio-mc
pkgver=2019_05_01T23_27_44Z
pkgrel=1
pkgdesc="Minio client, binary version"
url="https://min.io"
license=('Apache 2.0')
arch=('x86_64')

source_x86_64=("mc::https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.RELEASE.${pkgver//_/-}")
sha256sums_x86_64=('5c958946076f53c99a319515e3bfe2b8f58d4db171a828b00356e8c08d98e22a')


package() {
    install -Dm755 "$srcdir/mc" "$pkgdir/usr/bin/mc"
}
