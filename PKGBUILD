# Maintainer: ginkoid <g@gnk.io>
_pkg=docker-credential-gcr
pkgname=$_pkg-bin
pkgver=2.1.5
pkgrel=1
pkgdesc="Google Container Registry's standalone, gcloud SDK-independent Docker credential helper"
arch=('x86_64')
url="https://github.com/GoogleCloudPlatform/$_pkg"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkg}_linux_amd64-$pkgver.tar.gz")
sha256sums=('091677f1c10fa1dad66e572a6cf0fb9a4dcc2e476cfb5046fad1f3fa3130784f')

package() {
  install -Dm755 "$srcdir/$_pkg" "$pkgdir/usr/bin/$_pkg"
}
