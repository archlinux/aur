# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='grype'
pkgver=0.17.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('03fbad48529446074bd3ee4767a10ca5ef1a8f37f429f5283b52da3d21f922a8')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/local/bin/${pkgname}"	
}