# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-cli-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="MongoDB CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache-2.0')
source=("https://fastdl.mongodb.org/mongocli/mongocli_${pkgver}_linux_${arch}.tar.gz")
b2sums=('dd8ad9fd01dca84087167a15f073ffeb0807ed17b3c35f14ec31394313fb8ab7f56d3b41104bbd1021abe33d10dd3c95049ca96631c1ef0b6d72ba8cfc31d772')

package() {
  install -D -m755 "${srcdir}/mongocli_${pkgver}_linux_${arch}/bin/mongocli" \
    "${pkgdir}/usr/bin/mongocli"
}
