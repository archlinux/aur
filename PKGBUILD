# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.27.8
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.27.8)
source_i686=(kubectl-gke-rapid-bin-v1.27.8::https://storage.googleapis.com/kubernetes-release/release/v1.27.8/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.27.8::https://storage.googleapis.com/kubernetes-release/release/v1.27.8/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.27.8::https://storage.googleapis.com/kubernetes-release/release/v1.27.8/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.27.8::https://storage.googleapis.com/kubernetes-release/release/v1.27.8/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.27.8::https://storage.googleapis.com/kubernetes-release/release/v1.27.8/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.27.8::https://storage.googleapis.com/kubernetes-release/release/v1.27.8/bin/linux/arm64/kubectl)
sha256sums_i686=(226dddb85d159a49e9c16b2561445693eae8b80241f77fe21c9a15fe5486093e)
sha256sums_x86_64=(027b3161e99fa0a7fa529e8f17f73ee2c0807c81c721ca7cf307f6b41c17bc57)
sha256sums_armv5=(2f2936f950beb3f08ee0e45fbf80d020163829b95aa11c99ec726ee1a922329c)
sha256sums_armv6h=(2f2936f950beb3f08ee0e45fbf80d020163829b95aa11c99ec726ee1a922329c)
sha256sums_armv7h=(2f2936f950beb3f08ee0e45fbf80d020163829b95aa11c99ec726ee1a922329c)
sha256sums_aarch64=(97ed6739e2803e63fd2d9de78be22d5ba6205bb63179a16ec773063526525a8e)
package () 
{ 
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
