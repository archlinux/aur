# Maintainer: ginkoid <g@gnk.io>
_pkg=docker-credential-gcr
pkgname=$_pkg-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Google Container Registry's standalone, gcloud SDK-independent Docker credential helper"
arch=('x86_64')
url="https://github.com/GoogleCloudPlatform/$_pkg"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkg}_linux_amd64-$pkgver.tar.gz")
sha256sums=('0b28c676e6e63bebaf6dfbe216419c7e169b4c069e1527ad463c4d7a25f6b247')

package() {
  install -Dm755 "$srcdir/$_pkg" "$pkgdir/usr/bin/$_pkg"
}
