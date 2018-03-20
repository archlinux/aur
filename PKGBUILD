# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Kubernetes.io client binary (beta)"
pkgver=1.10.0.rc1
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
provides=('kubectl-bin')
conflicts=('kubernetes>=1.4.6' 'kubectl-bin')
_kubectl_file=kubectl-$pkgver
source_i686=($_kubectl_file::https://storage.googleapis.com/kubernetes-release/release/v1.10.0-rc.1/bin/linux/386/kubectl)
source_x86_64=($_kubectl_file::https://storage.googleapis.com/kubernetes-release/release/v1.10.0-rc.1/bin/linux/amd64/kubectl)
md5sums_i686=('953232748d86c663187e5e967b0da7a2')
md5sums_x86_64=('2d97daa5b77f4ab5c1cac069dafa94c6')

package() {
  install -Dm 755 "$srcdir/$_kubectl_file" "$pkgdir/usr/bin/kubectl"
}
