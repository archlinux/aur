# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='infracost'
pkgver=0.9.20
pkgrel=1
pkgdesc='Infracost shows cloud cost estimates for Terraform. It lets DevOps, SRE and engineers see a cost breakdown and understand costs before making changes, either in the terminal or pull requests.'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('Apache')
source=("https://github.com/infracost/infracost/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('1a42d9abd469a39eb43b8e49166ecf6a97ff0ba9df532a08b3bf3435d816cbb2')
package() {
	install -Dm755 "$srcdir/infracost-linux-amd64" "${pkgdir}/usr/local/bin/${pkgname}"	
}
