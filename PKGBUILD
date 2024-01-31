# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mongodb-atlas-cli-bin
pkgver=1.14.2
pkgrel=1
pkgdesc="MongoDB Atlas CLI"
arch=('x86_64')
url="https://www.mongodb.com/products/tools/atlas-cli"
license=('Apache')
source=("https://fastdl.mongodb.org/mongocli/${pkgname%-bin}_${pkgver}_linux_${arch}.tar.gz")
b2sums=('4b74bd71a86abbb717d0cbaee5941ec2d8f4c7225fde8e240231b1f8971895f71deeb2b09ab19d8e0b765f59934fdcc8857ef1d98f6ac1dc79facc9e9c0cf2a8')

package() {
  install -D -m755 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_${arch}/bin/atlas" \
    "${pkgdir}/usr/bin/atlas"
}
