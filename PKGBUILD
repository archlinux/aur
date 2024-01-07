pkgname=kubectl-pgo
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI client for CrunchyData's PostgreSQL Operator"
arch=('x86_64')
url="https://github.com/CrunchyData/postgres-operator-client"
license=('Apache')
provides=('kubectl-pgo')
conflicts=('kubectl-pgo')
source=("${url}/releases/download/v${pkgver}/kubectl-pgo-linux-amd64")
sha256sums=('32a4f7b21b5f39b495a12bcf0d803c4535d4d0dd5245bd1db8c60d58735e1bc2')

package() {
	install -Dm755 "${srcdir}/kubectl-pgo-linux-amd64" "${pkgdir}/usr/bin/kubectl-pgo"
}
