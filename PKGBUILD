# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.30.3
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.30.3)
source_i686=(kubectl-gke-rapid-bin-v1.30.3::https://storage.googleapis.com/kubernetes-release/release/v1.30.3/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.30.3::https://storage.googleapis.com/kubernetes-release/release/v1.30.3/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.30.3::https://storage.googleapis.com/kubernetes-release/release/v1.30.3/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.30.3::https://storage.googleapis.com/kubernetes-release/release/v1.30.3/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.30.3::https://storage.googleapis.com/kubernetes-release/release/v1.30.3/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.30.3::https://storage.googleapis.com/kubernetes-release/release/v1.30.3/bin/linux/arm64/kubectl)
sha256sums_i686=(23d414e611ba8526605c8d9505595c4aa71a81b45d8121bb8a3ff9e72415f76b)
sha256sums_x86_64=(abd83816bd236b266c3643e6c852b446f068fe260f3296af1a25b550854ec7e5)
sha256sums_armv5=(f9147ca81cbcb7b1cf41b75d95a0fd3597defb7c0e6db8c54e6ca7f493929c71)
sha256sums_armv6h=(f9147ca81cbcb7b1cf41b75d95a0fd3597defb7c0e6db8c54e6ca7f493929c71)
sha256sums_armv7h=(f9147ca81cbcb7b1cf41b75d95a0fd3597defb7c0e6db8c54e6ca7f493929c71)
sha256sums_aarch64=(c6f9568f930b16101089f1036677bb15a3185e9ed9b8dbce2f518fb5a52b6787)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
