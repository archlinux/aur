# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-regular-bin
pkgver=v1.24.17
pkgrel=5
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-regular-bin kubectl-gke-regular-bin-bin)
provides=(kubectl-gke-regular-bin=v1.24.17)
source_i686=(kubectl-gke-regular-bin-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-regular-bin-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-regular-bin-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-regular-bin-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-regular-bin-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-regular-bin-v1.24.17::https://storage.googleapis.com/kubernetes-release/release/v1.24.17/bin/linux/arm64/kubectl)
sha256sums_i686=(b0cde7ca2973a4420aaaca967fe45fe3d763a319a4850955333f0e2c1036b4a4)
sha256sums_x86_64=(3e9588e3326c7110a163103fc3ea101bb0e85f4d6fd228cf928fa9a2a20594d5)
sha256sums_armv5=(870f60d318dfd845da9829848bda35a16f3c9a2127813e0f18dd59ec28401728)
sha256sums_armv6h=(870f60d318dfd845da9829848bda35a16f3c9a2127813e0f18dd59ec28401728)
sha256sums_armv7h=(870f60d318dfd845da9829848bda35a16f3c9a2127813e0f18dd59ec28401728)
sha256sums_aarch64=(66885bda3a202546778c77f0b66dcf7f576b5a49ff9456acf61329da784a602d)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
