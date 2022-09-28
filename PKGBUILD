# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.22.15
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.22.15")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.22.15" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.22.15::https://storage.googleapis.com/kubernetes-release/release/v1.22.15/bin/linux/386/kubectl')
sha256sums_i686=('7b7f9bfc9a2263f673dbc6a5e323f5145ef19c56c93267e91f0b8f332e2503b8')
source_x86_64=('kubectl-v1.22.15::https://storage.googleapis.com/kubernetes-release/release/v1.22.15/bin/linux/amd64/kubectl')
sha256sums_x86_64=('239a48f1e465ecfd99dd5e3d219066ffea7bbd4cdedb98524e82ff11fd72ba12')
source_armv5=('kubectl-v1.22.15::https://storage.googleapis.com/kubernetes-release/release/v1.22.15/bin/linux/arm/kubectl')
sha256sums_armv5=('011486177abff9623898a268de16ad1e17f9879b619c658add43aca8b3013201')
source_armv6h=('kubectl-v1.22.15::https://storage.googleapis.com/kubernetes-release/release/v1.22.15/bin/linux/arm/kubectl')
sha256sums_armv6h=('011486177abff9623898a268de16ad1e17f9879b619c658add43aca8b3013201')
source_armv7h=('kubectl-v1.22.15::https://storage.googleapis.com/kubernetes-release/release/v1.22.15/bin/linux/arm/kubectl')
sha256sums_armv7h=('011486177abff9623898a268de16ad1e17f9879b619c658add43aca8b3013201')
source_aarch64=('kubectl-v1.22.15::https://storage.googleapis.com/kubernetes-release/release/v1.22.15/bin/linux/arm64/kubectl')
sha256sums_aarch64=('206ccaa283eaf02f72d19cf7a490b71c7b9fa77c0eb265006db31ab84b56eac0')
