# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kfilt-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="kfilt can filter Kubernetes resources."
arch=('x86_64')
url="https://github.com/ryane/kfilt"
license=('Apache')
source=("kfilt_$pkgver::https://github.com/ryane/kfilt/releases/download/v${pkgver}/kfilt_linux_amd64")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  install -Dm755 "kfilt_$pkgver" "$pkgdir/usr/bin/kfilt"
}
