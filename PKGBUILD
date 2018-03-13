# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Kubernetes.io client binary (beta)"
pkgver=1.10.0.beta3
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
provides=('kubectl-bin')
conflicts=('kubernetes>=1.4.6' 'kubectl-bin')
_kubectl_file=kubectl-$pkgver
source_i686=($_kubectl_file::https://storage.googleapis.com/kubernetes-release/release/v1.10.0-beta.3/bin/linux/386/kubectl)
source_x86_64=($_kubectl_file::https://storage.googleapis.com/kubernetes-release/release/v1.10.0-beta.3/bin/linux/amd64/kubectl)
md5sums_i686=('319b2140f3a55fb9a8e04672ce2b34e0')
md5sums_x86_64=('f754e0f1686e413cfda3e819332f8240')

package() {
  install -Dm 755 "$srcdir/$_kubectl_file" "$pkgdir/usr/bin/kubectl"
}
