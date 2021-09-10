# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache')
source=("https://github.com/FairwindsOps/polaris/releases/download/${pkgver}/polaris_linux_amd64.tar.gz")
sha256sums=('aa303ecec957f4a1759d4bb1582c900a40ae74ef3aaf09c45f214b66d923d1e0')

package() {
  install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"
}
