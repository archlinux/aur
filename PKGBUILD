# Maintainer: larte <lauri.arte@gmail.com>
pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.4.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes=1.3.2-1')
source_i686=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/386/kubectl)
source_x86_64=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/amd64/kubectl)
md5sums_i686=('78b789fd5935351dffef5d02b913bebb')
md5sums_x86_64=('27341c93794a49c8704720b3bbe4b9ba')

package() {
    install -d "${pkgdir}"/usr/bin/
    install -D "${srcdir}"/kubectl "$pkgdir/usr/bin/"

}
