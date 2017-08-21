# Maintainer: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.7.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes>=1.4.6')
_kubectl_file=kubectl-$pkgver
source_i686=($_kubectl_file::https://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/386/kubectl)
source_x86_64=($_kubectl_file::https://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/amd64/kubectl)
md5sums_i686=('d590e6500d82fd2373657c9de36d441b')
md5sums_x86_64=('bfe096b0e6365500ad036c0408fb30bc')

package() {
  install -Dm 755 "$srcdir/$_kubectl_file" "$pkgdir/usr/bin/kubectl"
}
