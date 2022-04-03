# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='infracost'
pkgver=0.9.21
pkgrel=1
pkgdesc='Infracost shows cloud cost estimates for Terraform. It lets DevOps, SRE and engineers see a cost breakdown and understand costs before making changes, either in the terminal or pull requests.'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('Apache')
source=("https://github.com/infracost/infracost/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('c821babf8ac246c60a4d3dfd32a185bd19f3d52f0620f1b2b94c36a74c4c022f')
package() {
	install -Dm755 "$srcdir/infracost-linux-amd64" "${pkgdir}/usr/local/bin/${pkgname}"	
}
