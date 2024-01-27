# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.29.1
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.29.1)
source_i686=(kubectl-gke-rapid-bin-v1.29.1::https://storage.googleapis.com/kubernetes-release/release/v1.29.1/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.29.1::https://storage.googleapis.com/kubernetes-release/release/v1.29.1/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.29.1::https://storage.googleapis.com/kubernetes-release/release/v1.29.1/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.29.1::https://storage.googleapis.com/kubernetes-release/release/v1.29.1/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.29.1::https://storage.googleapis.com/kubernetes-release/release/v1.29.1/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.29.1::https://storage.googleapis.com/kubernetes-release/release/v1.29.1/bin/linux/arm64/kubectl)
sha256sums_i686=(d8b8e75d78913bb92988b8f79372adf46ec33bdfea56bae3df519b5cf03d3e61)
sha256sums_x86_64=(69ab3a931e826bf7ac14d38ba7ca637d66a6fcb1ca0e3333a2cafdf15482af9f)
sha256sums_armv5=(a4b478cc0e9adaab0c5bb3627c20c5228ea0fe2aeff9e805d611eb3edb761972)
sha256sums_armv6h=(a4b478cc0e9adaab0c5bb3627c20c5228ea0fe2aeff9e805d611eb3edb761972)
sha256sums_armv7h=(a4b478cc0e9adaab0c5bb3627c20c5228ea0fe2aeff9e805d611eb3edb761972)
sha256sums_aarch64=(96d6dc7b2bdcd344ce58d17631c452225de5bbf59b83fd3c89c33c6298fb5d8b)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
