# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FairwindsOps/polaris/releases/download/${pkgver}/polaris_linux_amd64.tar.gz")
sha256sums=('00859191eaa2db51b3c277e055d10327c7b13cff4dc0ff1dcea4694dc7a96005')

package() {
  install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"
}
