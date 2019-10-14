# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache')
source=("https://github.com/FairwindsOps/polaris/releases/download/${pkgver}/polaris_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('8367e50a368e67bb119a9754fe43da85c0692251c61d57b653ed933d5de2ec1e')

package() {
  install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"
}
