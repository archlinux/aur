# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=kdn-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="CLI for Kaiden"
arch=("x86_64")
url="https://github.com/openkaiden/kdn"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("${url}/releases/download/v${pkgver}/kdn_${pkgver}_linux_amd64.tar.gz")
b2sums=('832a4b0b6673b946c92344d770f6e6115ecb559825014c1d3cd60d80f727341a1f6044274014818f4747f0e8403573b862ea4da916ff53804ea38f07b5ba5a3b')

package() {
    install -vDm755 -t "${pkgdir}/usr/bin/" kdn
}
