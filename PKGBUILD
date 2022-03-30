# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='kubectl-who-can'
pkgver=0.4.0
pkgrel=1
pkgdesc='Shows which subjects have RBAC permissions to VERB [TYPE | TYPE/NAME | NONRESOURCEURL] in Kubernetes'
url='https://github.com/aquasecurity/kubectl-who-can/'
arch=('x86_64')
license=('APACHE')
depends=('kubectl')
source=("https://github.com/aquasecurity/kubectl-who-can/releases/download/v${pkgver}/kubectl-who-can_linux_${arch}.tar.gz")
md5sums=('f289a4df217fd86a7692031b6a0afff4')
package() {
	install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"	
}
