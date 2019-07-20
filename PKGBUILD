# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kfilt-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="kfilt can filter Kubernetes resources."
arch=('x86_64')
url="https://github.com/ryane/kfilt"
license=('Apache')
source=("kfilt_$pkgver::https://github.com/ryane/kfilt/releases/download/v${pkgver}/kfilt_${pkgver}_linux_amd64")
sha256sums=('27dc55af69b27e64ec78575d6a61a85c191aa21d028a00d2fb357c8a2effe13e')

package() {
  install -Dm755 "kfilt_$pkgver" "$pkgdir/usr/bin/kfilt"
}
