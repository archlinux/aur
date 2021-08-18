# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='litmusctl'
pkgver=0.3.0
pkgrel=2
pkgdesc='The Litmuschaos command-line tool, litmusctl, allows you to manage litmuschaos agent plane. You can use litmusctl to create agents, project, and manage multiple litmuschaos accounts.'
url='https://github.com/litmuschaos/litmusctl'
arch=('x86_64')
license=('APACHE')
depends=('kubectl')
source=("https://litmusctl-bucket.s3-eu-west-1.amazonaws.com/litmusctl-linux-amd64-v${pkgver}.tar.gz")
md5sums=('SKIP')
package() {
	install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"	
}