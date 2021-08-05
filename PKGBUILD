# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='infracost'
pkgver=0.9.4
pkgrel=1
pkgdesc='Infracost shows cloud cost estimates for Terraform projects. It helps developers, devops and others to quickly see the cost breakdown and compare different options upfront.'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('APACHE')
source=("https://github.com/infracost/infracost/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
md5sums=('68e5152dac2ecd8f4081f8240e1d63e8')
package() {
	install -Dm755 "$srcdir/infracost-linux-amd64" "${pkgdir}/usr/local/bin/${pkgname}"	
}
