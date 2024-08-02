# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-cli-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="MongoDB CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache-2.0')
options=('!debug')
source=("https://fastdl.mongodb.org/mongocli/mongocli_${pkgver}_linux_${arch}.tar.gz")
b2sums=('69fa0df44e735b59c67cd345673e4c5c6244a102346a24392de7d8a3e773011e55e7f3330c8c7c62fa35d61bfed092da78ac61d8c5312a5fb8265f56774d5b01')

package() {
  install -D -m755 "${srcdir}/mongocli_${pkgver}_linux_${arch}/bin/mongocli" \
    "${pkgdir}/usr/bin/mongocli"
}
