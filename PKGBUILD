# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='infracost'
pkgver=0.9.4
pkgrel=2
pkgdesc='Infracost shows cloud cost estimates for Terraform projects. It helps developers, devops and others to quickly see the cost breakdown and compare different options upfront.'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('APACHE')
source=("https://github.com/infracost/infracost/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('972c12160c30cbacc1a14e519b594423fc11d17e91d702b0afb065ead07d4f75'
            'SKIP')
package() {
	install -Dm755 "$srcdir/infracost-linux-amd64" "${pkgdir}/usr/local/bin/${pkgname}"	
}
