# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-atlas-cli-bin
pkgver=1.29.0
pkgrel=1
pkgdesc="MongoDB Atlas CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache-2.0')
options=('!debug')
source=("https://fastdl.mongodb.org/mongocli/${pkgname%-bin}_${pkgver}_linux_${arch}.tar.gz")
b2sums=('6c9517c61919004b0f6ba5e6777675226e56e93c9196c851b4b0d722418dccade0348ae5e35fccae4e70fd7d72f86e8b6bdbfd8906ace4aca580b4b575cf184c')

package() {
  install -D -m755 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_${arch}/bin/atlas" \
    "${pkgdir}/usr/bin/atlas"
}
