# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.30.2
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.30.2)
source_i686=(kubectl-gke-rapid-bin-v1.30.2::https://storage.googleapis.com/kubernetes-release/release/v1.30.2/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.30.2::https://storage.googleapis.com/kubernetes-release/release/v1.30.2/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.30.2::https://storage.googleapis.com/kubernetes-release/release/v1.30.2/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.30.2::https://storage.googleapis.com/kubernetes-release/release/v1.30.2/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.30.2::https://storage.googleapis.com/kubernetes-release/release/v1.30.2/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.30.2::https://storage.googleapis.com/kubernetes-release/release/v1.30.2/bin/linux/arm64/kubectl)
sha256sums_i686=(57ac45d398238dbbb87cd61927f4d3799217286c7a2e364b0034b912ac9bae8f)
sha256sums_x86_64=(c6e9c45ce3f82c90663e3c30db3b27c167e8b19d83ed4048b61c1013f6a7c66e)
sha256sums_armv5=(2dab982920d87bc9a17c539bfa4f94b758afc454bb044029dee06144e8dbee08)
sha256sums_armv6h=(2dab982920d87bc9a17c539bfa4f94b758afc454bb044029dee06144e8dbee08)
sha256sums_armv7h=(2dab982920d87bc9a17c539bfa4f94b758afc454bb044029dee06144e8dbee08)
sha256sums_aarch64=(56becf07105fbacd2b70f87f3f696cfbed226cb48d6d89ed7f65ba4acae3f2f8)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
