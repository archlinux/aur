# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='grype'
pkgver=0.11.0
pkgrel=2
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('APACHE')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
md5sums=('4b90b8e1b60d506b56cc595c71eff68f')
package() {
	install -Dm755 "$srcdir/grype_0/grype" "${pkgdir}/usr/local/bin/${pkgname}"	
}