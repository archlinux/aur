# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.18.14
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.18.14")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.18.14" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.18.14::https://storage.googleapis.com/kubernetes-release/release/v1.18.14/bin/linux/386/kubectl')
sha256sums_i686=('1d00dce4d8538a4a0a02322e40b62ce863ab475dd652b41014e71fad9e4993e5')
source_x86_64=('kubectl-v1.18.14::https://storage.googleapis.com/kubernetes-release/release/v1.18.14/bin/linux/amd64/kubectl')
sha256sums_x86_64=('8c924c1fdf743c2a3bf0edbd4333f54c1bce64871abc1a729243321d99b567d4')
source_armv5=('kubectl-v1.18.14::https://storage.googleapis.com/kubernetes-release/release/v1.18.14/bin/linux/arm/kubectl')
sha256sums_armv5=('b2b88ee6bea8ee17dd1c7687add53c9db5139abb7013ded77050d57b62070aa7')
source_armv6h=('kubectl-v1.18.14::https://storage.googleapis.com/kubernetes-release/release/v1.18.14/bin/linux/arm/kubectl')
sha256sums_armv6h=('b2b88ee6bea8ee17dd1c7687add53c9db5139abb7013ded77050d57b62070aa7')
source_armv7h=('kubectl-v1.18.14::https://storage.googleapis.com/kubernetes-release/release/v1.18.14/bin/linux/arm/kubectl')
sha256sums_armv7h=('b2b88ee6bea8ee17dd1c7687add53c9db5139abb7013ded77050d57b62070aa7')
source_aarch64=('kubectl-v1.18.14::https://storage.googleapis.com/kubernetes-release/release/v1.18.14/bin/linux/arm64/kubectl')
sha256sums_aarch64=('ac4014f7d9001375cb600a15d77e90eb6a20053afac82f167f4b7732aa073388')
