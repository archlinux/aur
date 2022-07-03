# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='infracost'
pkgver=0.10.6
pkgrel=1
pkgdesc='Infracost shows cloud cost estimates for Terraform. It lets DevOps, SRE and engineers see a cost breakdown and understand costs before making changes, either in the terminal or pull requests.'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('Apache')
source=("https://github.com/infracost/infracost/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('3c625db74dbde2f5b02f778b79d7808f3c4f65a0cbe9b67d8c127bc5b976e626')
package() {
	install -Dm755 "$srcdir/infracost-linux-amd64" "${pkgdir}/usr/local/bin/${pkgname}"	
}
