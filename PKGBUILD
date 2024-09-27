# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.31.0
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.31.0)
source_i686=(kubectl-gke-rapid-bin-v1.31.0::https://storage.googleapis.com/kubernetes-release/release/v1.31.0/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.31.0::https://storage.googleapis.com/kubernetes-release/release/v1.31.0/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.31.0::https://storage.googleapis.com/kubernetes-release/release/v1.31.0/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.31.0::https://storage.googleapis.com/kubernetes-release/release/v1.31.0/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.31.0::https://storage.googleapis.com/kubernetes-release/release/v1.31.0/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.31.0::https://storage.googleapis.com/kubernetes-release/release/v1.31.0/bin/linux/arm64/kubectl)
sha256sums_i686=(6d9835b3f31eeb061833c83e21418d2a32dac20eccfeccf7641aa4dbf92945e2)
sha256sums_x86_64=(7c27adc64a84d1c0cc3dcf7bf4b6e916cc00f3f576a2dbac51b318d926032437)
sha256sums_armv5=(a4d6292c88c199688a03ea211bea08c8ae29f1794f5deeeef46862088d124baa)
sha256sums_armv6h=(a4d6292c88c199688a03ea211bea08c8ae29f1794f5deeeef46862088d124baa)
sha256sums_armv7h=(a4d6292c88c199688a03ea211bea08c8ae29f1794f5deeeef46862088d124baa)
sha256sums_aarch64=(f42832db7d77897514639c6df38214a6d8ae1262ee34943364ec1ffaee6c009c)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
