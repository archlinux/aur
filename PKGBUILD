# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-regular-bin
pkgver=v1.27.15
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-regular-bin kubectl-gke-regular-bin-bin)
provides=(kubectl-gke-regular-bin=v1.27.15)
source_i686=(kubectl-gke-regular-bin-v1.27.15::https://storage.googleapis.com/kubernetes-release/release/v1.27.15/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-regular-bin-v1.27.15::https://storage.googleapis.com/kubernetes-release/release/v1.27.15/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-regular-bin-v1.27.15::https://storage.googleapis.com/kubernetes-release/release/v1.27.15/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-regular-bin-v1.27.15::https://storage.googleapis.com/kubernetes-release/release/v1.27.15/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-regular-bin-v1.27.15::https://storage.googleapis.com/kubernetes-release/release/v1.27.15/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-regular-bin-v1.27.15::https://storage.googleapis.com/kubernetes-release/release/v1.27.15/bin/linux/arm64/kubectl)
sha256sums_i686=(062708176596bd4fe79d7b7a2e400a7b9c6c16532938c6fec5561bcf10045276)
sha256sums_x86_64=(c12cf17ec30fb162f8f5fb168e67d4e5b7d6826e08c7648a5f1c6b4e9ba23f39)
sha256sums_armv5=(533b0cd294fdc165e8a278a0c48687226025ff3894726af181e65eb479a6068c)
sha256sums_armv6h=(533b0cd294fdc165e8a278a0c48687226025ff3894726af181e65eb479a6068c)
sha256sums_armv7h=(533b0cd294fdc165e8a278a0c48687226025ff3894726af181e65eb479a6068c)
sha256sums_aarch64=(6bd6bd3092c0a8e536e8e5a56b22aaab87ab1e54a4556ce4d1bff2493180fb8c)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
