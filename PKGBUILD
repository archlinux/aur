# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-cli-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="MongoDB CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache-2.0')
options=('!debug')
source=("https://fastdl.mongodb.org/mongocli/mongocli_${pkgver}_linux_${arch}.tar.gz")
b2sums=('c9f48b3c6c40b2cf57333929398dba93b9a1a2ffdbef3e1985ed09f05f831c098b7c184cc23263c204200db681677d3c4b5a0b1d0721389916014f1778f56e3d')

package() {
  install -D -m755 "${srcdir}/mongocli_${pkgver}_linux_${arch}/bin/mongocli" \
    "${pkgdir}/usr/bin/mongocli"
}
