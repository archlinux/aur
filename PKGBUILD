# Maintainer: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.5.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes=1.4.6-1')
_kubectl_file=kubectl-$pkgver
source_i686=($_kubectl_file::http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/386/kubectl)
source_x86_64=($_kubectl_file::http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/amd64/kubectl)
md5sums_i686=('e2f18eadbd680967e86d255deb1ae248')
md5sums_x86_64=('4e8126e89b989227cdae106c7e5f63b9')

package() {
  install -Dm 755 "$srcdir/$_kubectl_file" "$pkgdir/usr/bin/kubectl"
}
