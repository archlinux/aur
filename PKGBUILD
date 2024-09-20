# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-stable-bin
pkgver=v1.28.13
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-stable-bin kubectl-gke-stable-bin-bin)
provides=(kubectl-gke-stable-bin=v1.28.13)
source_i686=(kubectl-gke-stable-bin-v1.28.13::https://storage.googleapis.com/kubernetes-release/release/v1.28.13/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-stable-bin-v1.28.13::https://storage.googleapis.com/kubernetes-release/release/v1.28.13/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-stable-bin-v1.28.13::https://storage.googleapis.com/kubernetes-release/release/v1.28.13/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-stable-bin-v1.28.13::https://storage.googleapis.com/kubernetes-release/release/v1.28.13/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-stable-bin-v1.28.13::https://storage.googleapis.com/kubernetes-release/release/v1.28.13/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-stable-bin-v1.28.13::https://storage.googleapis.com/kubernetes-release/release/v1.28.13/bin/linux/arm64/kubectl)
sha256sums_i686=(199bab4900e8e8bd1621c7fbb46dfe9774ef9718d682ab18db758f9bd3795ad2)
sha256sums_x86_64=(d7d363dd5a4c95444329bc5239b8718ebe84a043052958b2f15ee2feef9a28c6)
sha256sums_armv5=(05a76c89aa61946cdd5351fa43bbba237a11a4cf532357c01cda5dcb4606ce32)
sha256sums_armv6h=(05a76c89aa61946cdd5351fa43bbba237a11a4cf532357c01cda5dcb4606ce32)
sha256sums_armv7h=(05a76c89aa61946cdd5351fa43bbba237a11a4cf532357c01cda5dcb4606ce32)
sha256sums_aarch64=(a22d234724b82101e1f17e95ab60e0e13c91a0fe17ad0890b3d92681cd551bfa)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
