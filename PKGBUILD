# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='litmusctl'
pkgver=0.11.0
pkgrel=1
pkgdesc='The Litmuschaos command-line tool, litmusctl, allows you to manage litmuschaos agent plane. You can use litmusctl to create agents, project, and manage multiple litmuschaos accounts.'
url='https://github.com/litmuschaos/litmusctl'
arch=('x86_64')
license=('APACHE')
depends=('kubectl')
source=("https://github.com/litmuschaos/litmusctl/releases/download/v${pkgver}/litmusctl-linux-amd64-v${pkgver}.tar.gz")
sha256sums=('8954af06a04e2d78d13121ac1f894013aa73a5e964f97c5fa6df5c8b98c5591b')
package() {
	install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"	
}
