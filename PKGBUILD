# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-cli-bin
pkgver=1.31.0
pkgrel=1
pkgdesc="MongoDB CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache-2.0')
source=("https://fastdl.mongodb.org/mongocli/mongocli_${pkgver}_linux_${arch}.tar.gz")
b2sums=('e3d125ff02f4632ffc9f5cb6fca452d73d650de3cce076418c7048ead9fe37a655e6ae76de11da2c867d57f23d1da4e30bfca854e9e52a6fb8c60c294569a5c5')

package() {
  install -D -m755 "${srcdir}/mongocli_${pkgver}_linux_${arch}/bin/mongocli" \
    "${pkgdir}/usr/bin/mongocli"
}
