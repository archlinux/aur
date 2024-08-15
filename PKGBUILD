# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.30.4
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.30.4)
source_i686=(kubectl-gke-rapid-bin-v1.30.4::https://storage.googleapis.com/kubernetes-release/release/v1.30.4/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.30.4::https://storage.googleapis.com/kubernetes-release/release/v1.30.4/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.30.4::https://storage.googleapis.com/kubernetes-release/release/v1.30.4/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.30.4::https://storage.googleapis.com/kubernetes-release/release/v1.30.4/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.30.4::https://storage.googleapis.com/kubernetes-release/release/v1.30.4/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.30.4::https://storage.googleapis.com/kubernetes-release/release/v1.30.4/bin/linux/arm64/kubectl)
sha256sums_i686=(5951038e15459bfc33ea85f042cd8873e5d0db9a4e0043243f880eec85e9fd4a)
sha256sums_x86_64=(2ffd023712bbc1a9390dbd8c0c15201c165a69d394787ef03eda3eccb4b9ac06)
sha256sums_armv5=(a31676f522cc745f241b1fd5755b9965558e4f1f5db5149319439a15f49806d1)
sha256sums_armv6h=(a31676f522cc745f241b1fd5755b9965558e4f1f5db5149319439a15f49806d1)
sha256sums_armv7h=(a31676f522cc745f241b1fd5755b9965558e4f1f5db5149319439a15f49806d1)
sha256sums_aarch64=(1d8b4e6443c7df8e92a065d88d146142a202fea5ec694135b83d9668529ea3b1)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
