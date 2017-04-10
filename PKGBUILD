# Maintainer: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.6.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes=1.4.6-1')
_kubectl_file=kubectl-$pkgver
source_i686=($_kubectl_file::http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/386/kubectl)
source_x86_64=($_kubectl_file::http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/amd64/kubectl)
md5sums_i686=('802bb74109b960434680bcaf40d5711f')
md5sums_x86_64=('f50f239a54cacd5d0a89f9f7eb45616f')

package() {
  install -Dm 755 "$srcdir/$_kubectl_file" "$pkgdir/usr/bin/kubectl"
}
