# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.0.25
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

source=("https://github.com/nats-io/natscli/releases/download/${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('9f998830aeb0405f8d8c926da1b700d596ba5511c36404d85511312a9d81abb8')

package() {
	install -D -m755 $srcdir/nats-${pkgver}-linux-amd64/nats $pkgdir/usr/bin/nats
}
