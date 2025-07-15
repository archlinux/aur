# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-atlas-cli-bin
pkgver=1.46.2
pkgrel=1
pkgdesc="MongoDB Atlas CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache-2.0')
options=('!debug')
source=("https://fastdl.mongodb.org/mongocli/${pkgname%-bin}_${pkgver}_linux_${arch}.tar.gz")
b2sums=('15ffa4e683f98a00b2e420a46cda8b7286376df164ad35b1c1ade50b0eb4053942cec13782c7dcc2d6f1692d746a92f62e56d43ba8ed1ff732b43b89b510a779')

package() {
  install -D -m755 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_${arch}/bin/atlas" \
    "${pkgdir}/usr/bin/atlas"
}
