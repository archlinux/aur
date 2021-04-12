# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.0.22
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

source=("https://github.com/nats-io/natscli/releases/download/${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('dd0f52d19cb2cff8b71df6d68c479d7bd96e77914fb65bf641b5f3dae46d72c6')

package() {
	install -D -m755 $srcdir/nats-${pkgver}-linux-amd64/nats $pkgdir/usr/bin/nats
}
