# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-stable-bin
pkgver=v1.27.11
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-stable-bin kubectl-gke-stable-bin-bin)
provides=(kubectl-gke-stable-bin=v1.27.11)
source_i686=(kubectl-gke-stable-bin-v1.27.11::https://storage.googleapis.com/kubernetes-release/release/v1.27.11/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-stable-bin-v1.27.11::https://storage.googleapis.com/kubernetes-release/release/v1.27.11/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-stable-bin-v1.27.11::https://storage.googleapis.com/kubernetes-release/release/v1.27.11/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-stable-bin-v1.27.11::https://storage.googleapis.com/kubernetes-release/release/v1.27.11/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-stable-bin-v1.27.11::https://storage.googleapis.com/kubernetes-release/release/v1.27.11/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-stable-bin-v1.27.11::https://storage.googleapis.com/kubernetes-release/release/v1.27.11/bin/linux/arm64/kubectl)
sha256sums_i686=(3b1971a52d94989dcbb0d4e8d470d9459d0f7d6591242e63e0ef0b956189abe2)
sha256sums_x86_64=(7ae327978a1edb43700070c86f5fd77215792c6b58a7ea70192647e0da848e29)
sha256sums_armv5=(11586f333abaf2776e0d2f9e02c71ae5eeff3ad8e629815aa8bb7d7e9a406301)
sha256sums_armv6h=(11586f333abaf2776e0d2f9e02c71ae5eeff3ad8e629815aa8bb7d7e9a406301)
sha256sums_armv7h=(11586f333abaf2776e0d2f9e02c71ae5eeff3ad8e629815aa8bb7d7e9a406301)
sha256sums_aarch64=(d30e1aa873e78eb376ddee3c785aa78c44eddc56ce2ef901dac1ce0c2c4f50b0)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
