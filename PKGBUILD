# Maintainer: larte <lauri.arte@gmail.com>
pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.3.5
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes=1.3.2-1')
source_i686=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/386/kubectl)
source_x86_64=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/amd64/kubectl)
md5sums_i686=('99a387db4aa5729fff210b3830f0bfa7')
md5sums_x86_64=('26852c9bd750a2afee527658944397d1')

package() {
    install -d "${pkgdir}"/usr/bin/
    install -D "${srcdir}"/kubectl "$pkgdir/usr/bin/"

}
