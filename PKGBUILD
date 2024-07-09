# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-regular-bin
pkgver=v1.29.6
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-regular-bin kubectl-gke-regular-bin-bin)
provides=(kubectl-gke-regular-bin=v1.29.6)
source_i686=(kubectl-gke-regular-bin-v1.29.6::https://storage.googleapis.com/kubernetes-release/release/v1.29.6/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-regular-bin-v1.29.6::https://storage.googleapis.com/kubernetes-release/release/v1.29.6/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-regular-bin-v1.29.6::https://storage.googleapis.com/kubernetes-release/release/v1.29.6/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-regular-bin-v1.29.6::https://storage.googleapis.com/kubernetes-release/release/v1.29.6/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-regular-bin-v1.29.6::https://storage.googleapis.com/kubernetes-release/release/v1.29.6/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-regular-bin-v1.29.6::https://storage.googleapis.com/kubernetes-release/release/v1.29.6/bin/linux/arm64/kubectl)
sha256sums_i686=(cbf96cf7003f784c1d2ae5a04cac5ec5c06a71860ef70643d7a8643c1d544a94)
sha256sums_x86_64=(339553c919874ebe3b719e9e1fcd68b55bc8875f9b5a005cf4c028738d54d309)
sha256sums_armv5=(7762244b8da5564d2ee6a65403dd3aa3f94e8e9b16887c51936a4e941de8fd95)
sha256sums_armv6h=(7762244b8da5564d2ee6a65403dd3aa3f94e8e9b16887c51936a4e941de8fd95)
sha256sums_armv7h=(7762244b8da5564d2ee6a65403dd3aa3f94e8e9b16887c51936a4e941de8fd95)
sha256sums_aarch64=(21816488cf3af4cf2b956ee58f7afc5b4964c29488f63756f5ddcf09b0df5be9)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
