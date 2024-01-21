# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.28.6
pkgrel=2
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.28.6)
source_i686=(kubectl-gke-rapid-bin-v1.28.6::https://storage.googleapis.com/kubernetes-release/release/v1.28.6/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.28.6::https://storage.googleapis.com/kubernetes-release/release/v1.28.6/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.28.6::https://storage.googleapis.com/kubernetes-release/release/v1.28.6/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.28.6::https://storage.googleapis.com/kubernetes-release/release/v1.28.6/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.28.6::https://storage.googleapis.com/kubernetes-release/release/v1.28.6/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.28.6::https://storage.googleapis.com/kubernetes-release/release/v1.28.6/bin/linux/arm64/kubectl)
sha256sums_i686=(12a4d9b8bf5a9d5bdd09f70f4797bf3a1a9c50ffa1ad673272878f47805983cd)
sha256sums_x86_64=(c8351fe0611119fd36634dd3f53eb94ec1a2d43ef9e78b92b4846df5cc7aa7e3)
sha256sums_armv5=(2358d98d4970c177a3af0ae1c2398f69922074a961a61cdff6ae4a7f13106dc1)
sha256sums_armv6h=(2358d98d4970c177a3af0ae1c2398f69922074a961a61cdff6ae4a7f13106dc1)
sha256sums_armv7h=(2358d98d4970c177a3af0ae1c2398f69922074a961a61cdff6ae4a7f13106dc1)
sha256sums_aarch64=(0de705659a80c3fef01df43cc0926610fe31482f728b0f992818abd9bdcd2cb9)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
