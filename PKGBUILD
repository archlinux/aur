# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-stable-bin
pkgver=v1.26.14
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-stable-bin kubectl-gke-stable-bin-bin)
provides=(kubectl-gke-stable-bin=v1.26.14)
source_i686=(kubectl-gke-stable-bin-v1.26.14::https://storage.googleapis.com/kubernetes-release/release/v1.26.14/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-stable-bin-v1.26.14::https://storage.googleapis.com/kubernetes-release/release/v1.26.14/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-stable-bin-v1.26.14::https://storage.googleapis.com/kubernetes-release/release/v1.26.14/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-stable-bin-v1.26.14::https://storage.googleapis.com/kubernetes-release/release/v1.26.14/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-stable-bin-v1.26.14::https://storage.googleapis.com/kubernetes-release/release/v1.26.14/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-stable-bin-v1.26.14::https://storage.googleapis.com/kubernetes-release/release/v1.26.14/bin/linux/arm64/kubectl)
sha256sums_i686=(fa342a4b474f769a5680d6a77d38e91b4191caa228fd7385281539577d1bd1de)
sha256sums_x86_64=(afd9be91832a0400d8d9cc3da1cf2a395aa9f13b8ab245883869788786166ec3)
sha256sums_armv5=(68e57dc60939793d5ef81cf338351446d3b4911a1b7c80b9d28e679ba266aedd)
sha256sums_armv6h=(68e57dc60939793d5ef81cf338351446d3b4911a1b7c80b9d28e679ba266aedd)
sha256sums_armv7h=(68e57dc60939793d5ef81cf338351446d3b4911a1b7c80b9d28e679ba266aedd)
sha256sums_aarch64=(64b21431e5ff18a4999699d53815236ccb06a16d76c00cb812461110a5bd6318)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
