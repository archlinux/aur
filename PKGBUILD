# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')

conflicts=('natscli' 'natscli-git')
provides=('nats')

source=("https://github.com/nats-io/natscli/releases/download/v${pkgver}/nats-${pkgver}-linux-amd64.zip")

sha256sums=('751a0f5047ad140c7b788e614ec678f837ebfb69c64d11fb5bcbed48216726a7')

package() {
	install -D -m755 $srcdir/nats-${pkgver}-linux-amd64/nats $pkgdir/usr/bin/nats
}
