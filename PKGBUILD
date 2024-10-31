# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-cli-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="MongoDB CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache-2.0')
options=('!debug')
source=("https://fastdl.mongodb.org/mongocli/mongocli_${pkgver}_linux_${arch}.tar.gz")
b2sums=('010761f2633fe65d380800ca50852f20f64ae99a178f3ba6a58c33bfed45fcb4bb404cff48519d750be37ea8f8d8cbcb97f3ed3bbd6ee7f6c88c68d26e891b51')

package() {
  install -D -m755 "${srcdir}/mongocli_${pkgver}_linux_${arch}/bin/mongocli" \
    "${pkgdir}/usr/bin/mongocli"
}
