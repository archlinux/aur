# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-regular-bin
pkgver=v1.29.5
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-regular-bin kubectl-gke-regular-bin-bin)
provides=(kubectl-gke-regular-bin=v1.29.5)
source_i686=(kubectl-gke-regular-bin-v1.29.5::https://storage.googleapis.com/kubernetes-release/release/v1.29.5/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-regular-bin-v1.29.5::https://storage.googleapis.com/kubernetes-release/release/v1.29.5/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-regular-bin-v1.29.5::https://storage.googleapis.com/kubernetes-release/release/v1.29.5/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-regular-bin-v1.29.5::https://storage.googleapis.com/kubernetes-release/release/v1.29.5/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-regular-bin-v1.29.5::https://storage.googleapis.com/kubernetes-release/release/v1.29.5/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-regular-bin-v1.29.5::https://storage.googleapis.com/kubernetes-release/release/v1.29.5/bin/linux/arm64/kubectl)
sha256sums_i686=(e47b31e2565d4a87afade2af2bacc8f68b6cceb9f313a1193b727ed98f95d75b)
sha256sums_x86_64=(603c8681fc0d8609c851f9cc58bcf55eeb97e2934896e858d0232aa8d1138366)
sha256sums_armv5=(f3c83a9674098c5a4f27defed001934719f487897dd61db1992057e5ed103b3e)
sha256sums_armv6h=(f3c83a9674098c5a4f27defed001934719f487897dd61db1992057e5ed103b3e)
sha256sums_armv7h=(f3c83a9674098c5a4f27defed001934719f487897dd61db1992057e5ed103b3e)
sha256sums_aarch64=(9ee9168def12ac6a6c0c6430e0f73175e756ed262db6040f8aa2121ad2c1f62e)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
