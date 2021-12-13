# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli-bin
pkgver=0.0.28
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

conflicts=('natscli')
provides=('nats')

source=("https://github.com/nats-io/natscli/releases/download/v${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('0501cabd5da181a263bd2ac4d8bb35bddd022dd08fa2e2d537eae711997811a3')

package() {
	install -D -m755 $srcdir/nats-${pkgver}-linux-amd64/nats $pkgdir/usr/bin/nats
}
