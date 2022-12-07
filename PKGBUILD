# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.23.14
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.23.14")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.23.14" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.23.14::https://storage.googleapis.com/kubernetes-release/release/v1.23.14/bin/linux/386/kubectl')
sha256sums_i686=('da5f7e1409aed94fe6d0f8ea026d7e0ee1951ce32927ab369509615bb3eb4eae')
source_x86_64=('kubectl-v1.23.14::https://storage.googleapis.com/kubernetes-release/release/v1.23.14/bin/linux/amd64/kubectl')
sha256sums_x86_64=('13ce4b18ba6e15d5d259249c530637dd7fb9722d121df022099f3ed5f2bd74cd')
source_armv5=('kubectl-v1.23.14::https://storage.googleapis.com/kubernetes-release/release/v1.23.14/bin/linux/arm/kubectl')
sha256sums_armv5=('071f390f560320c4caff188d8f6f21c1b3258dfed600184f39d054d1d0673f69')
source_armv6h=('kubectl-v1.23.14::https://storage.googleapis.com/kubernetes-release/release/v1.23.14/bin/linux/arm/kubectl')
sha256sums_armv6h=('071f390f560320c4caff188d8f6f21c1b3258dfed600184f39d054d1d0673f69')
source_armv7h=('kubectl-v1.23.14::https://storage.googleapis.com/kubernetes-release/release/v1.23.14/bin/linux/arm/kubectl')
sha256sums_armv7h=('071f390f560320c4caff188d8f6f21c1b3258dfed600184f39d054d1d0673f69')
source_aarch64=('kubectl-v1.23.14::https://storage.googleapis.com/kubernetes-release/release/v1.23.14/bin/linux/arm64/kubectl')
sha256sums_aarch64=('857716aa5cd24500349e5de8238060845af34b91ac4683bd279988ad3e1d3efa')
