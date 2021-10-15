# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kfilt-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="kfilt can filter Kubernetes resources."
arch=('x86_64')
url="https://github.com/ryane/kfilt"
license=('Apache')
source=("kfilt_$pkgver::https://github.com/ryane/kfilt/releases/download/v${pkgver}/kfilt_${pkgver}_linux_amd64")
sha256sums=('8a16ce43971fcbe05a8d5fa534bd044d50df13b8ef41dd0c798e980d1214709f')

package() {
  install -Dm755 "kfilt_$pkgver" "$pkgdir/usr/bin/kfilt"
}
