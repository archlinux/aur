# Maintainer: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.9.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes>=1.4.6')
_kubectl_file=kubectl-$pkgver
source_i686=($_kubectl_file::https://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/386/kubectl)
source_x86_64=($_kubectl_file::https://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/amd64/kubectl)
md5sums_i686=('779dda6eba6591d568c55b01a7b104fc')
md5sums_x86_64=('01dce19bf06f7d49772a3cf687b6b586')

package() {
  install -Dm 755 "$srcdir/$_kubectl_file" "$pkgdir/usr/bin/kubectl"
}
