# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=4.0.3
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache')
source=("https://github.com/FairwindsOps/polaris/releases/download/${pkgver}/polaris_${pkgver}_linux_amd64.tar.gz")
sha256sums=('69663598349151fd5a389156facdbd2b74ab53f227bc1ad5698736a71ed5c513')

package() {
  install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"
}
