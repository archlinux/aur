# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-stable-bin
pkgver=v1.27.16
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-stable-bin kubectl-gke-stable-bin-bin)
provides=(kubectl-gke-stable-bin=v1.27.16)
source_i686=(kubectl-gke-stable-bin-v1.27.16::https://storage.googleapis.com/kubernetes-release/release/v1.27.16/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-stable-bin-v1.27.16::https://storage.googleapis.com/kubernetes-release/release/v1.27.16/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-stable-bin-v1.27.16::https://storage.googleapis.com/kubernetes-release/release/v1.27.16/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-stable-bin-v1.27.16::https://storage.googleapis.com/kubernetes-release/release/v1.27.16/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-stable-bin-v1.27.16::https://storage.googleapis.com/kubernetes-release/release/v1.27.16/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-stable-bin-v1.27.16::https://storage.googleapis.com/kubernetes-release/release/v1.27.16/bin/linux/arm64/kubectl)
sha256sums_i686=(bdd730a2c5528ace7f4e1821f94d492fcde154806c9c71342488a43d25fbc3b4)
sha256sums_x86_64=(97ea7cd771d0c6e3332614668a40d2c5996f0053ff11b44b198ea84dba0818cb)
sha256sums_armv5=(a0d585ae2638c896be3ff664e08fadaa4606d53538892e494b5f3ce671d32a41)
sha256sums_armv6h=(a0d585ae2638c896be3ff664e08fadaa4606d53538892e494b5f3ce671d32a41)
sha256sums_armv7h=(a0d585ae2638c896be3ff664e08fadaa4606d53538892e494b5f3ce671d32a41)
sha256sums_aarch64=(2f50cb29d73f696ffb57437d3e2c95b22c54f019de1dba19e2b834e0b4501eb9)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
