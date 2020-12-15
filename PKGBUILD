# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.18.13
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.18.13")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.18.13" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.18.13::https://storage.googleapis.com/kubernetes-release/release/v1.18.13/bin/linux/386/kubectl')
sha256sums_i686=('2dedfe158e5e28c8622f215440215bd7f701410ef191acac46b4d4f48833cdd5')
source_x86_64=('kubectl-v1.18.13::https://storage.googleapis.com/kubernetes-release/release/v1.18.13/bin/linux/amd64/kubectl')
sha256sums_x86_64=('8914a4529aaa5f358c663c03bc2cb741e5667f8142e37435689a851647b7697f')
source_armv5=('kubectl-v1.18.13::https://storage.googleapis.com/kubernetes-release/release/v1.18.13/bin/linux/arm/kubectl')
sha256sums_armv5=('f3e9a4786a774441ee448edb6f842f9c6825f12245b5e4ee5ffe8b2ab1c85058')
source_armv6h=('kubectl-v1.18.13::https://storage.googleapis.com/kubernetes-release/release/v1.18.13/bin/linux/arm/kubectl')
sha256sums_armv6h=('f3e9a4786a774441ee448edb6f842f9c6825f12245b5e4ee5ffe8b2ab1c85058')
source_armv7h=('kubectl-v1.18.13::https://storage.googleapis.com/kubernetes-release/release/v1.18.13/bin/linux/arm/kubectl')
sha256sums_armv7h=('f3e9a4786a774441ee448edb6f842f9c6825f12245b5e4ee5ffe8b2ab1c85058')
source_aarch64=('kubectl-v1.18.13::https://storage.googleapis.com/kubernetes-release/release/v1.18.13/bin/linux/arm64/kubectl')
sha256sums_aarch64=('8e5271e95442e373df1c67473484e387086f344a2e1445ee9f5a878ca7f4442c')
