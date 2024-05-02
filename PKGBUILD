# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-regular-bin
pkgver=v1.27.13
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-regular-bin kubectl-gke-regular-bin-bin)
provides=(kubectl-gke-regular-bin=v1.27.13)
source_i686=(kubectl-gke-regular-bin-v1.27.13::https://storage.googleapis.com/kubernetes-release/release/v1.27.13/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-regular-bin-v1.27.13::https://storage.googleapis.com/kubernetes-release/release/v1.27.13/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-regular-bin-v1.27.13::https://storage.googleapis.com/kubernetes-release/release/v1.27.13/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-regular-bin-v1.27.13::https://storage.googleapis.com/kubernetes-release/release/v1.27.13/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-regular-bin-v1.27.13::https://storage.googleapis.com/kubernetes-release/release/v1.27.13/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-regular-bin-v1.27.13::https://storage.googleapis.com/kubernetes-release/release/v1.27.13/bin/linux/arm64/kubectl)
sha256sums_i686=(ca654a9ff05fcfb9408d6a7dae8bbdd237920c2aa863773bfb4a1c69b3d1751e)
sha256sums_x86_64=(e991f163197cbd85bbff22f656a74d48b69db5addfa43cc04cca0cf5328f57f1)
sha256sums_armv5=(8008a94f57e1aaa88097f4ac9ceae33d86e78bf0bf306a8c1942ab9adf7c5ea0)
sha256sums_armv6h=(8008a94f57e1aaa88097f4ac9ceae33d86e78bf0bf306a8c1942ab9adf7c5ea0)
sha256sums_armv7h=(8008a94f57e1aaa88097f4ac9ceae33d86e78bf0bf306a8c1942ab9adf7c5ea0)
sha256sums_aarch64=(4838ad8f3902c928f6139d69eba962b1cc2471511c828885650d728d970594d1)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
