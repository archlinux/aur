# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=4.0.4
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache')
source=("https://github.com/FairwindsOps/polaris/releases/download/${pkgver}/polaris_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c94ff4a7b3ddffc98aa874bd17f7156cf7c96a8d42e485d26efc4a741ee4d2a9')

package() {
  install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"
}
