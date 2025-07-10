# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=minc-bin
pkgver=0.0.11
pkgrel=2
pkgdesc="MicroShift in Container"
arch=("x86_64")
url="https://github.com/minc-org/minc"
license=("GPL-3.0-only")
depends=(
    'podman'
)
source=("https://github.com/minc-org/minc/releases/download/v$pkgver/minc_linux_amd64")
b2sums=('a7fb426f594526110d532758f578aeaa4915e57098f9d2d52f89f88d0db36988cf008397922bac00f70bedd6adb29d779ed991a3268e48828e65f75f853f55b8')

package() {
    install -Dm755 "minc_linux_amd64" "${pkgdir}/usr/bin/minc"
}
