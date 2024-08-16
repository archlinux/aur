# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-regular-bin
pkgver=v1.29.8
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-regular-bin kubectl-gke-regular-bin-bin)
provides=(kubectl-gke-regular-bin=v1.29.8)
source_i686=(kubectl-gke-regular-bin-v1.29.8::https://storage.googleapis.com/kubernetes-release/release/v1.29.8/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-regular-bin-v1.29.8::https://storage.googleapis.com/kubernetes-release/release/v1.29.8/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-regular-bin-v1.29.8::https://storage.googleapis.com/kubernetes-release/release/v1.29.8/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-regular-bin-v1.29.8::https://storage.googleapis.com/kubernetes-release/release/v1.29.8/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-regular-bin-v1.29.8::https://storage.googleapis.com/kubernetes-release/release/v1.29.8/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-regular-bin-v1.29.8::https://storage.googleapis.com/kubernetes-release/release/v1.29.8/bin/linux/arm64/kubectl)
sha256sums_i686=(bc31c21e7499856fa105d4187b6d057b3a47d40624f93c9107d78c6fd8b58016)
sha256sums_x86_64=(038454e0d79748aab41668f44ca6e4ac8affd1895a94f592b9739a0ae2a5f06a)
sha256sums_armv5=(f59f597d5e6174479185b54d0014e0bf84b7110c707fe07b133f94a7d7ae45be)
sha256sums_armv6h=(f59f597d5e6174479185b54d0014e0bf84b7110c707fe07b133f94a7d7ae45be)
sha256sums_armv7h=(f59f597d5e6174479185b54d0014e0bf84b7110c707fe07b133f94a7d7ae45be)
sha256sums_aarch64=(adf0007e702e05f59fb8de159463765c4440f872515bd04c24939d9c8fb5e4c7)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
