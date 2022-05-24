# Maintainer: ginkoid <g@gnk.io>
_pkg=docker-credential-gcr
pkgname=$_pkg-bin
pkgver=2.1.4
pkgrel=1
pkgdesc="Google Container Registry's standalone, gcloud SDK-independent Docker credential helper"
arch=('x86_64')
url="https://github.com/GoogleCloudPlatform/$_pkg"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkg}_linux_amd64-$pkgver.tar.gz")
sha256sums=('750afc8d9f530a11949b676c9cd592b003a35f5f2d9ae5e8a78b423c91fb4a0e')

package() {
  install -Dm755 "$srcdir/$_pkg" "$pkgdir/usr/bin/$_pkg"
}
