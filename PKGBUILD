# Maintainer: David Stark <david@starkers.org>

pkgname=dive
pkgver=0.0.8
_build=${pkgver}
pkgrel=1
pkgdesc="A tool for exploring each layer in a docker image"
url="https://github.com/wagoodman/dive"
arch=("x86_64")
license=("MIT")
conflicts=()

source_x86_64=("https://github.com/wagoodman/dive/releases/download/v${pkgver}/dive_${pkgver}_linux_amd64.tar.gz")
md5sums_x86_64=("56cdcd34bbbc6e8b668927020fb1b25c")

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/dive ${pkgdir}/usr/bin/dive
}
