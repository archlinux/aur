# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.28.4
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.28.4)
source_i686=(kubectl-gke-rapid-bin-v1.28.4::https://storage.googleapis.com/kubernetes-release/release/v1.28.4/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.28.4::https://storage.googleapis.com/kubernetes-release/release/v1.28.4/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.28.4::https://storage.googleapis.com/kubernetes-release/release/v1.28.4/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.28.4::https://storage.googleapis.com/kubernetes-release/release/v1.28.4/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.28.4::https://storage.googleapis.com/kubernetes-release/release/v1.28.4/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.28.4::https://storage.googleapis.com/kubernetes-release/release/v1.28.4/bin/linux/arm64/kubectl)
sha256sums_i686=(d0264bafbf47f1a8c564d393b355639c783b96eefa01ad6a7bbd8e87a272bf3e)
sha256sums_x86_64=(893c92053adea6edbbd4e959c871f5c21edce416988f968bec565d115383f7b8)
sha256sums_armv5=(835ef8d72f8dec4493b855ddd8e4163f107053496d923c89c216489a45757df6)
sha256sums_armv6h=(835ef8d72f8dec4493b855ddd8e4163f107053496d923c89c216489a45757df6)
sha256sums_armv7h=(835ef8d72f8dec4493b855ddd8e4163f107053496d923c89c216489a45757df6)
sha256sums_aarch64=(edf1e17b41891ec15d59dd3cc62bcd2cdce4b0fd9c2ee058b0967b17534457d7)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
