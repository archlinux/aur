# Maintainer: ginkoid <ginkoid@gmail.com>
_pkg=docker-credential-gcr
pkgname=$_pkg-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Google Container Registry's standalone, gcloud SDK-independent Docker credential helper"
arch=('x86_64')
url="https://github.com/GoogleCloudPlatform/$_pkg"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkg}_linux_amd64-$pkgver.tar.gz")
sha256sums=('91cca7b5ca33133bcd217982be31d670efe7f1a33eb5be72e014f74feecac00f')

package() {
  install -Dm755 "$srcdir/$_pkg" "$pkgdir/usr/bin/$_pkg"
}
