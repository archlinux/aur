# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli
pkgver=0.0.23
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

source=("https://github.com/nats-io/natscli/releases/download/${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('6ff61822358a1ed57d527d22e5cc9a103aca30bdb0f27831bb9db4e4b15d67c0')

package() {
	install -D -m755 $srcdir/nats-${pkgver}-linux-amd64/nats $pkgdir/usr/bin/nats
}
