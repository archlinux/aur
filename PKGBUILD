# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-regular-bin
pkgver=v1.29.7
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-regular-bin kubectl-gke-regular-bin-bin)
provides=(kubectl-gke-regular-bin=v1.29.7)
source_i686=(kubectl-gke-regular-bin-v1.29.7::https://storage.googleapis.com/kubernetes-release/release/v1.29.7/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-regular-bin-v1.29.7::https://storage.googleapis.com/kubernetes-release/release/v1.29.7/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-regular-bin-v1.29.7::https://storage.googleapis.com/kubernetes-release/release/v1.29.7/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-regular-bin-v1.29.7::https://storage.googleapis.com/kubernetes-release/release/v1.29.7/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-regular-bin-v1.29.7::https://storage.googleapis.com/kubernetes-release/release/v1.29.7/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-regular-bin-v1.29.7::https://storage.googleapis.com/kubernetes-release/release/v1.29.7/bin/linux/arm64/kubectl)
sha256sums_i686=(d7f61eb0a38213fa78128b9ee7a9a1528d9c6162114fefbbc111cb98178c2a77)
sha256sums_x86_64=(e3df008ef60ea50286ea93c3c40a020e178a338cea64a185b4e21792d88c75d6)
sha256sums_armv5=(cf875cbbdca7ea0e190075c7a4b3f2fa59864079c1fe9da482f8806b1ad64364)
sha256sums_armv6h=(cf875cbbdca7ea0e190075c7a4b3f2fa59864079c1fe9da482f8806b1ad64364)
sha256sums_armv7h=(cf875cbbdca7ea0e190075c7a4b3f2fa59864079c1fe9da482f8806b1ad64364)
sha256sums_aarch64=(7b6649aaa298be728c5fb7ccb65f98738a4e8bda0741afbd5a9ed9e488c0e725)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
