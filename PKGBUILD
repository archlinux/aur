# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='litmusctl'
pkgver=0.3.0
pkgrel=1
pkgdesc='The Litmuschaos command-line tool, litmusctl, allows you to manage litmuschaos agent plane. You can use litmusctl to create agents, project, and manage multiple litmuschaos accounts.'
url='https://github.com/litmuschaos/litmusctl'
arch=('amd64')
license=('APACHE')
depends=('kubectl')
source=("https://litmusctl-bucket.s3-eu-west-1.amazonaws.com/litmusctl-linux-${arch}-v${pkgver}.tar.gz")
md5sums=('SKIP')
package() {
	install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"	
}