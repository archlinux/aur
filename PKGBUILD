# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kubectl-gke-rapid-bin
pkgver=v1.29.2
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
url='https://github.com/kubernetes/kubectl'
arch=(i686 x86_64 armv5 armv6h armv7h aarch64)
license=(Apache-2.0)
install=''
conflicts=(kubectl-gke-rapid-bin kubectl-gke-rapid-bin-bin)
provides=(kubectl-gke-rapid-bin=v1.29.2)
source_i686=(kubectl-gke-rapid-bin-v1.29.2::https://storage.googleapis.com/kubernetes-release/release/v1.29.2/bin/linux/386/kubectl)
source_x86_64=(kubectl-gke-rapid-bin-v1.29.2::https://storage.googleapis.com/kubernetes-release/release/v1.29.2/bin/linux/amd64/kubectl)
source_armv5=(kubectl-gke-rapid-bin-v1.29.2::https://storage.googleapis.com/kubernetes-release/release/v1.29.2/bin/linux/arm/kubectl)
source_armv6h=(kubectl-gke-rapid-bin-v1.29.2::https://storage.googleapis.com/kubernetes-release/release/v1.29.2/bin/linux/arm/kubectl)
source_armv7h=(kubectl-gke-rapid-bin-v1.29.2::https://storage.googleapis.com/kubernetes-release/release/v1.29.2/bin/linux/arm/kubectl)
source_aarch64=(kubectl-gke-rapid-bin-v1.29.2::https://storage.googleapis.com/kubernetes-release/release/v1.29.2/bin/linux/arm64/kubectl)
sha256sums_i686=(e29e54882f436a0b2b8b787220f7f2b3474fce40933cec8546d18ac9e6811937)
sha256sums_x86_64=(7816d067740f47f949be826ac76943167b7b3a38c4f0c18b902fffa8779a5afa)
sha256sums_armv5=(f1bab202f0ce0c4209af0a977fc3dd4076397b1983544e09942ca4f586dff900)
sha256sums_armv6h=(f1bab202f0ce0c4209af0a977fc3dd4076397b1983544e09942ca4f586dff900)
sha256sums_armv7h=(f1bab202f0ce0c4209af0a977fc3dd4076397b1983544e09942ca4f586dff900)
sha256sums_aarch64=(3507ecb4224cf05ae2151a98d4932253624e7762159936d5347b19fe037655ca)
package () 
{ 
    set -eo pipefail;
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/kubectl"
}
