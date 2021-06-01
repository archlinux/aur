# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='kubectl-who-can'
pkgver=0.3.0
pkgrel=2
pkgdesc='Shows which subjects have RBAC permissions to VERB [TYPE | TYPE/NAME | NONRESOURCEURL] in Kubernetes'
url='https://github.com/aquasecurity/kubectl-who-can/'
arch=('x86_64')
license=('APACHE')
depends=('kubectl')
source=("https://github.com/aquasecurity/kubectl-who-can/releases/download/v${pkgver}/kubectl-who-can_linux_${arch}.tar.gz")
md5sums=('d9b28538fc9961c45334ec011042fb11')
package() {
	install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"	
}