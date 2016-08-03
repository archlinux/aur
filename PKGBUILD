# Maintainer: larte <lauri.arte@gmail.com>
pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.3.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes=1.3.2-1')
source_i686=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/386/kubectl)
source_x86_64=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/amd64/kubectl)
md5sums_i686=('1f6d7ece5fb4c8d184b189c936cca2a5')
md5sums_x86_64=('2e8f3099537db2bc8217eaed9e8718f2')

package() {
    install -d "${pkgdir}"/usr/bin/
    install -D "${srcdir}"/kubectl "$pkgdir/usr/bin/"

}
