# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-stable-bin
pkgver=v1.28.10
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-stable-bin kubectl-gke-stable-bin-bin)
provides=(kubectl-gke-stable-bin=v1.28.10)
source_i686=(kubectl-gke-stable-bin-v1.28.10::https://storage.googleapis.com/kubernetes-release/release/v1.28.10/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-stable-bin-v1.28.10::https://storage.googleapis.com/kubernetes-release/release/v1.28.10/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-stable-bin-v1.28.10::https://storage.googleapis.com/kubernetes-release/release/v1.28.10/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-stable-bin-v1.28.10::https://storage.googleapis.com/kubernetes-release/release/v1.28.10/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-stable-bin-v1.28.10::https://storage.googleapis.com/kubernetes-release/release/v1.28.10/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-stable-bin-v1.28.10::https://storage.googleapis.com/kubernetes-release/release/v1.28.10/bin/linux/arm64/kubectl)
sha256sums_i686=(0c007de9359e38d422b431725d3d2d0a9949eea3fce148d1818572ca06954f8a)
sha256sums_x86_64=(389c17a9700a4b01ebb055e39b8bc0886330497440dde004b5ed90f2a3a028db)
sha256sums_armv5=(e7b977779169f394383696afe872f6f0a4274789adbce1b70f5b28a20ee2cbd0)
sha256sums_armv6h=(e7b977779169f394383696afe872f6f0a4274789adbce1b70f5b28a20ee2cbd0)
sha256sums_armv7h=(e7b977779169f394383696afe872f6f0a4274789adbce1b70f5b28a20ee2cbd0)
sha256sums_aarch64=(e659d23d442c2706debe5b96742326c0a1e1d7b5c695a9fe7dfe8ea7402caee8)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
