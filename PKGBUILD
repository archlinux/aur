# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-stable-bin
pkgver=v1.28.11
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-stable-bin kubectl-gke-stable-bin-bin)
provides=(kubectl-gke-stable-bin=v1.28.11)
source_i686=(kubectl-gke-stable-bin-v1.28.11::https://storage.googleapis.com/kubernetes-release/release/v1.28.11/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-stable-bin-v1.28.11::https://storage.googleapis.com/kubernetes-release/release/v1.28.11/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-stable-bin-v1.28.11::https://storage.googleapis.com/kubernetes-release/release/v1.28.11/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-stable-bin-v1.28.11::https://storage.googleapis.com/kubernetes-release/release/v1.28.11/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-stable-bin-v1.28.11::https://storage.googleapis.com/kubernetes-release/release/v1.28.11/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-stable-bin-v1.28.11::https://storage.googleapis.com/kubernetes-release/release/v1.28.11/bin/linux/arm64/kubectl)
sha256sums_i686=(dc4fcb0a4e7f94ca8ddcad480eab74155d9378ff13d86e54d3b4e402eafb7a20)
sha256sums_x86_64=(1dba63e1a5c9520fc516c6e817924d927b9b83b8e08254c8fe2a2edb65da7a9c)
sha256sums_armv5=(2710129489d782a35c5273202a7148aac42e316c5117aa89c64a8cc62f9ce140)
sha256sums_armv6h=(2710129489d782a35c5273202a7148aac42e316c5117aa89c64a8cc62f9ce140)
sha256sums_armv7h=(2710129489d782a35c5273202a7148aac42e316c5117aa89c64a8cc62f9ce140)
sha256sums_aarch64=(7984a98d52365d190b6f56caa962339a7228b6f432e58ba5f1b1e60dbedac275)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
