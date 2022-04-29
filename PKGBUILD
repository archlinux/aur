# Maintainer: ginkoid <g@gnk.io>
_pkg=docker-credential-gcr
pkgname=$_pkg-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Google Container Registry's standalone, gcloud SDK-independent Docker credential helper"
arch=('x86_64')
url="https://github.com/GoogleCloudPlatform/$_pkg"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkg}_linux_amd64-$pkgver.tar.gz")
sha256sums=('81aa0c08a1cf4eac5ad4f55c8697b38ac461d544376bfbedba2301ac7d00e198')

package() {
  install -Dm755 "$srcdir/$_pkg" "$pkgdir/usr/bin/$_pkg"
}
