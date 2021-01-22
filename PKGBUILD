# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.0.21
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

source=("https://github.com/nats-io/natscli/releases/download/${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('987dec00fb11517c15ea5a986131c507418999e629c0c3e8dded73dd853019f2')

package() {
    install -D -m755 $srcdir/nats $pkgdir/usr/bin/nats
}
