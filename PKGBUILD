# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli-bin
pkgver=0.0.34
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

conflicts=('natscli')
provides=('nats')

source=("https://github.com/nats-io/natscli/releases/download/v${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('4f57234271b0600dc905933e6add707a36fb14353090de3c973220e8f8e2d65b')

package() {
	install -D -m755 $srcdir/nats-${pkgver}-linux-amd64/nats $pkgdir/usr/bin/nats
}
