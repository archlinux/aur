# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='grype'
pkgver=0.12.1
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('APACHE')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
md5sums=('c27e58e0a2b8f5a6905b65d6d5fda183')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/local/bin/${pkgname}"	
}