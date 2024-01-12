# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.28.5
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.28.5)
source_i686=(kubectl-gke-rapid-bin-v1.28.5::https://storage.googleapis.com/kubernetes-release/release/v1.28.5/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.28.5::https://storage.googleapis.com/kubernetes-release/release/v1.28.5/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.28.5::https://storage.googleapis.com/kubernetes-release/release/v1.28.5/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.28.5::https://storage.googleapis.com/kubernetes-release/release/v1.28.5/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.28.5::https://storage.googleapis.com/kubernetes-release/release/v1.28.5/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.28.5::https://storage.googleapis.com/kubernetes-release/release/v1.28.5/bin/linux/arm64/kubectl)
sha256sums_i686=(0f64a2856a765d5062c96ab46f17f4c33c006e43bffea0d4fe63d287d55db545)
sha256sums_x86_64=(2a44c0841b794d85b7819b505da2ff3acd5950bd1bcd956863714acc80653574)
sha256sums_armv5=(0819c9d0ea66a1e20d74d9a455090e1f67fe07d671866be342ab55532203f4bc)
sha256sums_armv6h=(0819c9d0ea66a1e20d74d9a455090e1f67fe07d671866be342ab55532203f4bc)
sha256sums_armv7h=(0819c9d0ea66a1e20d74d9a455090e1f67fe07d671866be342ab55532203f4bc)
sha256sums_aarch64=(f87fe017ae3ccfd93df03bf17edd4089672528107f230563b8c9966909661ef2)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
