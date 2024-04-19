# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-regular-bin
pkgver=v1.28.9
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-regular-bin kubectl-gke-regular-bin-bin)
provides=(kubectl-gke-regular-bin=v1.28.9)
source_i686=(kubectl-gke-regular-bin-v1.28.9::https://storage.googleapis.com/kubernetes-release/release/v1.28.9/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-regular-bin-v1.28.9::https://storage.googleapis.com/kubernetes-release/release/v1.28.9/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-regular-bin-v1.28.9::https://storage.googleapis.com/kubernetes-release/release/v1.28.9/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-regular-bin-v1.28.9::https://storage.googleapis.com/kubernetes-release/release/v1.28.9/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-regular-bin-v1.28.9::https://storage.googleapis.com/kubernetes-release/release/v1.28.9/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-regular-bin-v1.28.9::https://storage.googleapis.com/kubernetes-release/release/v1.28.9/bin/linux/arm64/kubectl)
sha256sums_i686=(6276afaedda301cf206e7379b61c6f9f67aa8dfd1ba0a20a996f32ca334c2df2)
sha256sums_x86_64=(b4693d0b22f509250694b10c7727c42b427d570af04f2065fe23a55d6c0051f1)
sha256sums_armv5=(2da7aead4f58aefee6892b2cc8184de26ef7808bf2d599553267d5cdbc1ce83a)
sha256sums_armv6h=(2da7aead4f58aefee6892b2cc8184de26ef7808bf2d599553267d5cdbc1ce83a)
sha256sums_armv7h=(2da7aead4f58aefee6892b2cc8184de26ef7808bf2d599553267d5cdbc1ce83a)
sha256sums_aarch64=(e0341d3973213f8099e7fcbbf6d1d506967bc2b7a4faac3fb3b4340f226e9b2f)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
