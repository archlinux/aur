# Maintainer: David Stark <david@starkers.org>

pkgname=dive
pkgver=0.6.0
_build=${pkgver}
pkgrel=4
pkgdesc="A tool for exploring each layer in a docker image"
url="https://github.com/wagoodman/dive"
arch=("x86_64")
license=("MIT")
conflicts=()

source_x86_64=("https://github.com/wagoodman/dive/releases/download/v${pkgver}/dive_${pkgver}_linux_amd64.tar.gz")
md5sums_x86_64=("17855f80fcfef47e65ede67b237f7ca9")

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/dive ${pkgdir}/usr/bin/dive
}
