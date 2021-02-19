# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='infracost'
pkgver=0.7.20
pkgrel=1
pkgdesc='Infracost shows cloud cost estimates for Terraform projects. It helps developers, devops and others to quickly see the cost breakdown and compare different options upfront.'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('APACHE')
source=("https://github.com/infracost/infracost/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
md5sums=('86b78c7626c5fe940c777e8d5f334e3b')
package() {
	install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"	
}
