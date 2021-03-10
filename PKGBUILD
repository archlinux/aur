# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=3.1.6
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache')
source=("https://github.com/FairwindsOps/polaris/releases/download/${pkgver}/polaris_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ede385beb24d34350a6dee603c1a0c2359e43722a77c2517681fbd05a859077c')

package() {
  install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"
}
