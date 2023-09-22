# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.24.17
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.24.17")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.24.17" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/386/kubectl')
sha256sums_i686=('b0cde7ca2973a4420aaaca967fe45fe3d763a319a4850955333f0e2c1036b4a4')
source_x86_64=('kubectl-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/amd64/kubectl')
sha256sums_x86_64=('3e9588e3326c7110a163103fc3ea101bb0e85f4d6fd228cf928fa9a2a20594d5')
source_armv5=('kubectl-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/arm/kubectl')
sha256sums_armv5=('870f60d318dfd845da9829848bda35a16f3c9a2127813e0f18dd59ec28401728')
source_armv6h=('kubectl-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/arm/kubectl')
sha256sums_armv6h=('870f60d318dfd845da9829848bda35a16f3c9a2127813e0f18dd59ec28401728')
source_armv7h=('kubectl-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/arm/kubectl')
sha256sums_armv7h=('870f60d318dfd845da9829848bda35a16f3c9a2127813e0f18dd59ec28401728')
source_aarch64=('kubectl-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/arm64/kubectl')
sha256sums_aarch64=('66885bda3a202546778c77f0b66dcf7f576b5a49ff9456acf61329da784a602d')
