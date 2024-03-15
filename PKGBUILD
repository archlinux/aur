# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-stable-bin
pkgver=v1.26.15
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-stable-bin kubectl-gke-stable-bin-bin)
provides=(kubectl-gke-stable-bin=v1.26.15)
source_i686=(kubectl-gke-stable-bin-v1.26.15::https://storage.googleapis.com/kubernetes-release/release/v1.26.15/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-stable-bin-v1.26.15::https://storage.googleapis.com/kubernetes-release/release/v1.26.15/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-stable-bin-v1.26.15::https://storage.googleapis.com/kubernetes-release/release/v1.26.15/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-stable-bin-v1.26.15::https://storage.googleapis.com/kubernetes-release/release/v1.26.15/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-stable-bin-v1.26.15::https://storage.googleapis.com/kubernetes-release/release/v1.26.15/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-stable-bin-v1.26.15::https://storage.googleapis.com/kubernetes-release/release/v1.26.15/bin/linux/arm64/kubectl)
sha256sums_i686=(5522ebc742d12e12ac616ccc5c33d15db952ad3b5c63724841209bc0acf6578d)
sha256sums_x86_64=(b75f359e6fad3cdbf05a0ee9d5872c43383683bb8527a9e078bb5b8a44350a41)
sha256sums_armv5=(1f8bf6049212bcf5880333bfe1311cc95d304e6d51864edd5008c0f8ec2a966f)
sha256sums_armv6h=(1f8bf6049212bcf5880333bfe1311cc95d304e6d51864edd5008c0f8ec2a966f)
sha256sums_armv7h=(1f8bf6049212bcf5880333bfe1311cc95d304e6d51864edd5008c0f8ec2a966f)
sha256sums_aarch64=(1396313f0f8e84ab1879757797992f1af043e1050283532e0fd8469902632216)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
