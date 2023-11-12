# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.27.7
pkgrel=1
pkgdesc="Kubernetes.io client binary, compatible with the GKE version from the rapid channel"
url="https://github.com/kubernetes/kubectl"
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.27.7)
source_i686=(kubectl-gke-rapid-bin-v1.27.7::https://storage.googleapis.com/kubernetes-release/release/v1.27.7/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.27.7::https://storage.googleapis.com/kubernetes-release/release/v1.27.7/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.27.7::https://storage.googleapis.com/kubernetes-release/release/v1.27.7/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.27.7::https://storage.googleapis.com/kubernetes-release/release/v1.27.7/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.27.7::https://storage.googleapis.com/kubernetes-release/release/v1.27.7/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.27.7::https://storage.googleapis.com/kubernetes-release/release/v1.27.7/bin/linux/arm64/kubectl)
sha256sums_i686=(3457daadd974741f6740b03aab4a440937d75f8a3a1d35d2e2f2eaa06a52b234)
sha256sums_x86_64=(e5fe510ba6f421958358d3d43b3f0b04c2957d4bc3bb24cf541719af61a06d79)
sha256sums_armv5=(2a387ade64cd4cf90f002ae8c0e6f60250d26d1ee2cce6051f559430a44352ea)
sha256sums_armv6h=(2a387ade64cd4cf90f002ae8c0e6f60250d26d1ee2cce6051f559430a44352ea)
sha256sums_armv7h=(2a387ade64cd4cf90f002ae8c0e6f60250d26d1ee2cce6051f559430a44352ea)
sha256sums_aarch64=(61fc334f2c0290270e43fb8a1d4ff07e8cec5642d5a123eb7ab66a134b04ae83)
package () 
{ 
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
