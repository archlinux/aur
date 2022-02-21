# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=mizu-bin
pkgver=27.2
pkgrel=1
pkgdesc="A simple-yet-powerful API traffic viewer for Kubernetes enabling you to view all API communication between microservices to help your debug and troubleshoot regressions."
arch=('x86_64')
url="https://github.com/up9inc/mizu"
license=('Apache')
source=("https://github.com/up9inc/mizu/releases/download/${pkgver}/mizu_linux_amd64")
sha256sums=('8fb706332c57cf5ebe545a5cd45408b08b35e1c6b0656b3262ba9ebf2081b207')

package() {
	install -D -m755 mizu_linux_amd64 -T "${pkgdir}/usr/bin/mizu"
}
