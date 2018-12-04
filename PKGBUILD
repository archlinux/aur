# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Kubernetes.io client binary (beta)"
pkgver=1.13.1_beta.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
provides=('kubectl-bin')
conflicts=('kubernetes>=1.4.6' 'kubectl-bin')
source_i686=(kubectl-${pkgver//_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver//_/-}/bin/linux/386/kubectl)
source_x86_64=(kubectl-${pkgver//_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver//_/-}/bin/linux/amd64/kubectl)
md5sums_i686=('ed610257e142ed2baf1abd6119c73106')
md5sums_x86_64=('14ab72ec927535d070331da16e02c5e3')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver//_/-}" "$pkgdir/usr/bin/kubectl"
}
