# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-stable-bin
pkgver=v1.27.10
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-stable-bin kubectl-gke-stable-bin-bin)
provides=(kubectl-gke-stable-bin=v1.27.10)
source_i686=(kubectl-gke-stable-bin-v1.27.10::https://storage.googleapis.com/kubernetes-release/release/v1.27.10/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-stable-bin-v1.27.10::https://storage.googleapis.com/kubernetes-release/release/v1.27.10/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-stable-bin-v1.27.10::https://storage.googleapis.com/kubernetes-release/release/v1.27.10/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-stable-bin-v1.27.10::https://storage.googleapis.com/kubernetes-release/release/v1.27.10/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-stable-bin-v1.27.10::https://storage.googleapis.com/kubernetes-release/release/v1.27.10/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-stable-bin-v1.27.10::https://storage.googleapis.com/kubernetes-release/release/v1.27.10/bin/linux/arm64/kubectl)
sha256sums_i686=(6e8fac066c583e36b1cb63bcd044dc2d2b253e9ecf01a0125e3ae55a14958fda)
sha256sums_x86_64=(bfb219643c28d9842fceae51590776f06987835d93fc3cb9b0149c9111c741ac)
sha256sums_armv5=(4d81649935ec127f9aa21954697f82e0796f61e8e6406fd058b3a8b80e858c8e)
sha256sums_armv6h=(4d81649935ec127f9aa21954697f82e0796f61e8e6406fd058b3a8b80e858c8e)
sha256sums_armv7h=(4d81649935ec127f9aa21954697f82e0796f61e8e6406fd058b3a8b80e858c8e)
sha256sums_aarch64=(2e1996379d5a8b132e0606fcd3df3c8689e11882630b75cca3b7135126847871)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
