# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli-bin
pkgver=0.0.26
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

conflicts=('natscli')
provides=('nats')

source=("https://github.com/nats-io/natscli/releases/download/${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('d6a1f0aed5710eee69740fc1da24576a716076e7e3eca83a4772d1ea637a8fde')

package() {
	install -D -m755 $srcdir/nats-${pkgver}-linux-amd64/nats $pkgdir/usr/bin/nats
}
