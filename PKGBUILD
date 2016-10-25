# Maintainer: larte <lauri.arte@gmail.com>
pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.4.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes=1.3.2-1')
source_i686=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/386/kubectl)
source_x86_64=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/amd64/kubectl)
md5sums_i686=('b7f998db2105724c5070a6039d1ce2e4')
md5sums_x86_64=('6a2912492f2cd845319a843bbcd89d1b')

package() {
    install -d "${pkgdir}"/usr/bin/
    install -D "${srcdir}"/kubectl "$pkgdir/usr/bin/"

}
