# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='litmusctl'
pkgver=0.9.0
pkgrel=1
pkgdesc='The Litmuschaos command-line tool, litmusctl, allows you to manage litmuschaos agent plane. You can use litmusctl to create agents, project, and manage multiple litmuschaos accounts.'
url='https://github.com/litmuschaos/litmusctl'
arch=('x86_64')
license=('APACHE')
depends=('kubectl')
source=("https://litmusctl-production-bucket.s3.amazonaws.com/litmusctl-linux-amd64-v${pkgver}.tar.gz")
sha256sums=('4e86f22a198b8b3c5896acfec0cdf926e8e82afe0fd3eaa1590e9a85659194e3')
package() {
	install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"	
}
