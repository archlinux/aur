# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-regular-bin
pkgver=v1.27.14
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-regular-bin kubectl-gke-regular-bin-bin)
provides=(kubectl-gke-regular-bin=v1.27.14)
source_i686=(kubectl-gke-regular-bin-v1.27.14::https://storage.googleapis.com/kubernetes-release/release/v1.27.14/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-regular-bin-v1.27.14::https://storage.googleapis.com/kubernetes-release/release/v1.27.14/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-regular-bin-v1.27.14::https://storage.googleapis.com/kubernetes-release/release/v1.27.14/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-regular-bin-v1.27.14::https://storage.googleapis.com/kubernetes-release/release/v1.27.14/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-regular-bin-v1.27.14::https://storage.googleapis.com/kubernetes-release/release/v1.27.14/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-regular-bin-v1.27.14::https://storage.googleapis.com/kubernetes-release/release/v1.27.14/bin/linux/arm64/kubectl)
sha256sums_i686=(0cf1ab4b8fbe950daf7406acc9099d1239e3a8204b9af885d162a716308ae053)
sha256sums_x86_64=(1d2431c68bb6dfa9de3cd40fd66d97a9ac73593c489f9467249eea43e9c16a1e)
sha256sums_armv5=(75caa5e6845887a273a3bebc0f67994b8aaeaab65f5ecd4c2a7d1f9f5c14e3ee)
sha256sums_armv6h=(75caa5e6845887a273a3bebc0f67994b8aaeaab65f5ecd4c2a7d1f9f5c14e3ee)
sha256sums_armv7h=(75caa5e6845887a273a3bebc0f67994b8aaeaab65f5ecd4c2a7d1f9f5c14e3ee)
sha256sums_aarch64=(29f3a1f520d929df38873c68dec73519c1e5e521140e01cf9d7701f7b5ffe4f3)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
