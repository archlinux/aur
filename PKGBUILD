# Maintainer: ginkoid <ginkoid@gmail.com>
_pkg=docker-credential-gcr
pkgname=$_pkg-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="Google Container Registry's standalone, gcloud SDK-independent Docker credential helper"
arch=('x86_64')
url="https://github.com/GoogleCloudPlatform/$_pkg"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkg}_linux_amd64-$pkgver.tar.gz")
sha256sums=('a673b3d6e2fddd0fe6baf807f7b11f98714eb5b901b0c27e26cd33b0bc291ad5')

package() {
  install -Dm755 "$srcdir/$_pkg" "$pkgdir/usr/bin/$_pkg"
}
