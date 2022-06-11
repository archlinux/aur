# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='infracost'
pkgver=0.10.3
pkgrel=1
pkgdesc='Infracost shows cloud cost estimates for Terraform. It lets DevOps, SRE and engineers see a cost breakdown and understand costs before making changes, either in the terminal or pull requests.'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('Apache')
source=("https://github.com/infracost/infracost/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('9369d22f769e310217effc23544b90d55d3bc29911fbf617b44df4162988079b')
package() {
	install -Dm755 "$srcdir/infracost-linux-amd64" "${pkgdir}/usr/local/bin/${pkgname}"	
}
