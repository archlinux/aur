# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kfilt-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="kfilt can filter Kubernetes resources."
arch=('x86_64')
url="https://github.com/ryane/kfilt"
license=('Apache')
source=("kfilt_$pkgver::https://github.com/ryane/kfilt/releases/download/v$pkgver/kfilt_$pkgver_linux_amd64")
sha256sums=('d8ab08c87667ba6e4a5907f110237cf8296d6bcc9bf19106d5e52b5497fff950')

package() {
  install -Dm755 "kfilt_$pkgver" "$pkgdir/usr/bin/kfilt"
}
