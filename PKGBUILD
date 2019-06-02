# Maintainer: winlu <derwinlu@gmail.com>

pkgname=minio-mc-bin
_srcname=minio-mc
pkgver=2019_05_29T21_21_34Z
pkgrel=1
pkgdesc="Minio client, binary version"
url="https://min.io"
license=('Apache 2.0')
arch=('x86_64')

source_x86_64=("mc::https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.RELEASE.${pkgver//_/-}")
sha256sums_x86_64=('74fac61c9f68a19ae2dedc78bc4a97fc77f319f46d3ab8ecdc966c6116f5c299')


package() {
    install -Dm755 "$srcdir/mc" "$pkgdir/usr/bin/mc"
}
