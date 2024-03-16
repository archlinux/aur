# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.29.3
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.29.3)
source_i686=(kubectl-gke-rapid-bin-v1.29.3::https://storage.googleapis.com/kubernetes-release/release/v1.29.3/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.29.3::https://storage.googleapis.com/kubernetes-release/release/v1.29.3/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.29.3::https://storage.googleapis.com/kubernetes-release/release/v1.29.3/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.29.3::https://storage.googleapis.com/kubernetes-release/release/v1.29.3/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.29.3::https://storage.googleapis.com/kubernetes-release/release/v1.29.3/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.29.3::https://storage.googleapis.com/kubernetes-release/release/v1.29.3/bin/linux/arm64/kubectl)
sha256sums_i686=(2365d1e9e720683d4e670dbca2ede2c4c598ac28eabea989be57519d83447937)
sha256sums_x86_64=(89c0435cec75278f84b62b848b8c0d3e15897d6947b6c59a49ddccd93d7312bf)
sha256sums_armv5=(12f72bd88eaa04cd8f09827c64195a695fdd5fb64e11c98524c83d21bcb0e37a)
sha256sums_armv6h=(12f72bd88eaa04cd8f09827c64195a695fdd5fb64e11c98524c83d21bcb0e37a)
sha256sums_armv7h=(12f72bd88eaa04cd8f09827c64195a695fdd5fb64e11c98524c83d21bcb0e37a)
sha256sums_aarch64=(191a96b27e3c6ae28b330da4c9bfefc9592762670727df4fcf124c9f1d5a466a)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
