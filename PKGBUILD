# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kfilt-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="kfilt can filter Kubernetes resources."
arch=('x86_64')
url="https://github.com/ryane/kfilt"
license=('Apache')
source=("kfilt_$pkgver::https://github.com/ryane/kfilt/releases/download/v${pkgver}/kfilt_linux_amd64")
sha256sums=('37cf474936d2db58e8b82b5406d367a24a38e6cc8218bc22ca38236e9604b01d')

package() {
  install -Dm755 "kfilt_$pkgver" "$pkgdir/usr/bin/kfilt"
}
