# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

conflicts=('natscli' 'natscli-git')
provides=('nats')

source=("https://github.com/nats-io/natscli/releases/download/v${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('f8a3e106deebed7afe736b7090359bda3aa62a04b310440bedc1d11a93c0ab4f')

package() {
  install -D -m755 $srcdir/nats-${pkgver}-linux-amd64/nats $pkgdir/usr/bin/nats
}
