# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kfilt-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="kfilt can filter Kubernetes resources."
arch=('x86_64')
url="https://github.com/ryane/kfilt"
license=('Apache')
source=("kfilt_$pkgver::https://github.com/ryane/kfilt/releases/download/v${pkgver}/kfilt_${pkgver}_linux_amd64")
sha256sums=('506bb3cd245b9f5235073626c0fe3d0ae205ca0f4de0e006b875e6bb8143e69a')

package() {
  install -Dm755 "kfilt_$pkgver" "$pkgdir/usr/bin/kfilt"
}
