# Maintainer: ginkoid <ginkoid@gmail.com>
_pkg=docker-credential-gcr
pkgname=$_pkg-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="Google Container Registry's standalone, gcloud SDK-independent Docker credential helper"
arch=('x86_64')
url="https://github.com/GoogleCloudPlatform/$_pkg"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkg}_linux_amd64-$pkgver.tar.gz")
sha256sums=('4fca8441c41802f4bcc4912672c55d4b1232decb90639f8a684d3b389e4e6e91')

package() {
  install -Dm755 "$srcdir/$_pkg" "$pkgdir/usr/bin/$_pkg"
}
