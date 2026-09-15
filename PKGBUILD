# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-atlas-cli-bin
pkgver=1.58.3
pkgrel=1
pkgdesc="MongoDB Atlas CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache-2.0')
options=('!debug')
source=("https://fastdl.mongodb.org/mongocli/${pkgname%-bin}_${pkgver}_linux_${arch}.tar.gz")
b2sums=('a69ed54c7124824b2e7461160810c7c64b0a3b62e7a8825fc63f19c9348524c02b68bb82173333e4de318b9e4e37c45398b3941cfa6e9899f62d95a3015a45a1')

package() {
  install -D -m755 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_${arch}/bin/atlas" \
    "${pkgdir}/usr/bin/atlas"
}
