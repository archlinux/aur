# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='infracost'
pkgver=0.9.6
pkgrel=1
pkgdesc='Infracost shows cloud cost estimates for Terraform projects. It helps developers, devops and others to quickly see the cost breakdown and compare different options upfront.'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('Apache')
source=("https://github.com/infracost/infracost/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('b7acf63cc46af57e69590fb89df2e35cb804ef2b5451cd88b7a3ca2c7b654df3')
package() {
	install -Dm755 "$srcdir/infracost-linux-amd64" "${pkgdir}/usr/local/bin/${pkgname}"	
}