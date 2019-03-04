# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Kubernetes.io client binary (beta)"
pkgver=1.14.0_beta.1
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('apache')
provides=('kubectl-bin')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver//_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver//_/-}/bin/linux/amd64/kubectl")
sha256sums=('31a027f335bf6c5042eadaea9b4623b28e6255560ed502eeb697d3313124f5bd')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver//_/-}" "$pkgdir/usr/bin/kubectl"
}
