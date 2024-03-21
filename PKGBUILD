# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-stable-bin
pkgver=v1.25.16
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-stable-bin kubectl-gke-stable-bin-bin)
provides=(kubectl-gke-stable-bin=v1.25.16)
source_i686=(kubectl-gke-stable-bin-v1.25.16::https://storage.googleapis.com/kubernetes-release/release/v1.25.16/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-stable-bin-v1.25.16::https://storage.googleapis.com/kubernetes-release/release/v1.25.16/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-stable-bin-v1.25.16::https://storage.googleapis.com/kubernetes-release/release/v1.25.16/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-stable-bin-v1.25.16::https://storage.googleapis.com/kubernetes-release/release/v1.25.16/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-stable-bin-v1.25.16::https://storage.googleapis.com/kubernetes-release/release/v1.25.16/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-stable-bin-v1.25.16::https://storage.googleapis.com/kubernetes-release/release/v1.25.16/bin/linux/arm64/kubectl)
sha256sums_i686=(fc402605202b90c8fe4461ec57ce444c1e6f4eeec8d8713bc9bd13c836750c2d)
sha256sums_x86_64=(5a9bc1d3ebfc7f6f812042d5f97b82730f2bdda47634b67bddf36ed23819ab17)
sha256sums_armv5=(c3456afacfc37a38404ba9a0b096903164bff5840c1212ff699edc9c17cf1bd2)
sha256sums_armv6h=(c3456afacfc37a38404ba9a0b096903164bff5840c1212ff699edc9c17cf1bd2)
sha256sums_armv7h=(c3456afacfc37a38404ba9a0b096903164bff5840c1212ff699edc9c17cf1bd2)
sha256sums_aarch64=(d6c23c80828092f028476743638a091f2f5e8141273d5228bf06c6671ef46924)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
