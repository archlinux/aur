# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='infracost'
pkgver=0.8.6
pkgrel=2
pkgdesc='Infracost shows cloud cost estimates for Terraform projects. It helps developers, devops and others to quickly see the cost breakdown and compare different options upfront.'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('APACHE')
source=("https://github.com/infracost/infracost/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
md5sums=('f20421e169f4a9c803baf21e51212fb6')
package() {
	install -Dm755 "$srcdir/infracost-linux-amd64" "${pkgdir}/usr/local/bin/${pkgname}"	
}
