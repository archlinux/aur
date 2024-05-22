# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.30.1
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.30.1)
source_i686=(kubectl-gke-rapid-bin-v1.30.1::https://storage.googleapis.com/kubernetes-release/release/v1.30.1/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.30.1::https://storage.googleapis.com/kubernetes-release/release/v1.30.1/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.30.1::https://storage.googleapis.com/kubernetes-release/release/v1.30.1/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.30.1::https://storage.googleapis.com/kubernetes-release/release/v1.30.1/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.30.1::https://storage.googleapis.com/kubernetes-release/release/v1.30.1/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.30.1::https://storage.googleapis.com/kubernetes-release/release/v1.30.1/bin/linux/arm64/kubectl)
sha256sums_i686=(1668e47b78c45f54fd0a2d6d82b7d12bacc286f06391814e9d4736a06016a169)
sha256sums_x86_64=(5b86f0b06e1a5ba6f8f00e2b01e8ed39407729c4990aeda961f83a586f975e8a)
sha256sums_armv5=(b05c4c4b1c440e8797445b8b15e9f4a00010f1365533a2420b9e68428da19d89)
sha256sums_armv6h=(b05c4c4b1c440e8797445b8b15e9f4a00010f1365533a2420b9e68428da19d89)
sha256sums_armv7h=(b05c4c4b1c440e8797445b8b15e9f4a00010f1365533a2420b9e68428da19d89)
sha256sums_aarch64=(d90446719b815e3abfe7b2c46ddf8b3fda17599f03ab370d6e47b1580c0e869e)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
