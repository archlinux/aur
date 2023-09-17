# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli-bin
pkgver=0.0.35
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

conflicts=('natscli' 'natscli-git')
provides=('nats')

source=("https://github.com/nats-io/natscli/releases/download/v${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('edc9437c20d983cd4a82a086519d06de6ab19f37a61e94b2f6359d460ea48d24')

package() {
	install -D -m755 $srcdir/nats-${pkgver}-linux-amd64/nats $pkgdir/usr/bin/nats
}
