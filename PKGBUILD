# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.29.4
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.29.4)
source_i686=(kubectl-gke-rapid-bin-v1.29.4::https://storage.googleapis.com/kubernetes-release/release/v1.29.4/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.29.4::https://storage.googleapis.com/kubernetes-release/release/v1.29.4/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.29.4::https://storage.googleapis.com/kubernetes-release/release/v1.29.4/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.29.4::https://storage.googleapis.com/kubernetes-release/release/v1.29.4/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.29.4::https://storage.googleapis.com/kubernetes-release/release/v1.29.4/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.29.4::https://storage.googleapis.com/kubernetes-release/release/v1.29.4/bin/linux/arm64/kubectl)
sha256sums_i686=(2fb69b7a38cfc5733786593662f5bde264ef802c4678fd397b4b033beae774c9)
sha256sums_x86_64=(10e343861c3cb0010161e703307ba907add2aeeeaffc6444779ad915f9889c88)
sha256sums_armv5=(ff4a1f437dc902b73505841a7705a6405694856a798e962ec2fdf7793f0aeadb)
sha256sums_armv6h=(ff4a1f437dc902b73505841a7705a6405694856a798e962ec2fdf7793f0aeadb)
sha256sums_armv7h=(ff4a1f437dc902b73505841a7705a6405694856a798e962ec2fdf7793f0aeadb)
sha256sums_aarch64=(61537408eedcad064d7334384aed508a8aa1ea786311b87b505456a2e0535d36)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
