# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-atlas-cli-bin
pkgver=1.28.0
pkgrel=1
pkgdesc="MongoDB Atlas CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache-2.0')
options=('!debug')
source=("https://fastdl.mongodb.org/mongocli/${pkgname%-bin}_${pkgver}_linux_${arch}.tar.gz")
b2sums=('fc43ba8d3ab0fb6b0afc8c8f312d2156999afe04990af1b597743535e5fe0efc3794804f624c5ed25901ef6a28041d582d66115b31de26d8680403bb974db82c')

package() {
  install -D -m755 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_${arch}/bin/atlas" \
    "${pkgdir}/usr/bin/atlas"
}
