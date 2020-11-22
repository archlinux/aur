# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.18.12
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.18.12")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.18.12" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.18.12::https://storage.googleapis.com/kubernetes-release/release/v1.18.12/bin/linux/386/kubectl')
sha256sums_i686=('a466e4443e7940f4c255702a80980a6705226db51f12f826344d3e95b7fb7906')
source_x86_64=('kubectl-v1.18.12::https://storage.googleapis.com/kubernetes-release/release/v1.18.12/bin/linux/amd64/kubectl')
sha256sums_x86_64=('ea2f6d0542b7bd259ccf7dd139fdad20767f7c5bf94c19c50df227396a08d76d')
source_armv5=('kubectl-v1.18.12::https://storage.googleapis.com/kubernetes-release/release/v1.18.12/bin/linux/arm/kubectl')
sha256sums_armv5=('4380ddb37d49e1199ebaa1f2785bd81ae22ffac15ad470d48f7308e9bf131b26')
source_armv6h=('kubectl-v1.18.12::https://storage.googleapis.com/kubernetes-release/release/v1.18.12/bin/linux/arm/kubectl')
sha256sums_armv6h=('4380ddb37d49e1199ebaa1f2785bd81ae22ffac15ad470d48f7308e9bf131b26')
source_armv7h=('kubectl-v1.18.12::https://storage.googleapis.com/kubernetes-release/release/v1.18.12/bin/linux/arm/kubectl')
sha256sums_armv7h=('4380ddb37d49e1199ebaa1f2785bd81ae22ffac15ad470d48f7308e9bf131b26')
source_aarch64=('kubectl-v1.18.12::https://storage.googleapis.com/kubernetes-release/release/v1.18.12/bin/linux/arm64/kubectl')
sha256sums_aarch64=('3cae828a3dca46b12284839e4273a1cfcf35177937ca5aa5aa49193d6eb0649b')
