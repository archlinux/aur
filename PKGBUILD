# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.17.15
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.17.15")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.17.15" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.17.15::https://storage.googleapis.com/kubernetes-release/release/v1.17.15/bin/linux/386/kubectl')
sha256sums_i686=('4c4272aa180ab7f28327c2f5a4e3b4677528d152d97fb2b11ccc73e29b524feb')
source_x86_64=('kubectl-v1.17.15::https://storage.googleapis.com/kubernetes-release/release/v1.17.15/bin/linux/amd64/kubectl')
sha256sums_x86_64=('a94f33ab8c5c68a2d9f177ad1e6654bbbd7ea52e80ed7ed9938fe6d6ca1f7d26')
source_armv5=('kubectl-v1.17.15::https://storage.googleapis.com/kubernetes-release/release/v1.17.15/bin/linux/arm/kubectl')
sha256sums_armv5=('1a194431c62652ab699f992ec60cb30f76fa91d0f090d8950c2a68dc8f852313')
source_armv6h=('kubectl-v1.17.15::https://storage.googleapis.com/kubernetes-release/release/v1.17.15/bin/linux/arm/kubectl')
sha256sums_armv6h=('1a194431c62652ab699f992ec60cb30f76fa91d0f090d8950c2a68dc8f852313')
source_armv7h=('kubectl-v1.17.15::https://storage.googleapis.com/kubernetes-release/release/v1.17.15/bin/linux/arm/kubectl')
sha256sums_armv7h=('1a194431c62652ab699f992ec60cb30f76fa91d0f090d8950c2a68dc8f852313')
source_aarch64=('kubectl-v1.17.15::https://storage.googleapis.com/kubernetes-release/release/v1.17.15/bin/linux/arm64/kubectl')
sha256sums_aarch64=('a75af21eae2913aacd521cc8a052f7b9f1cb8b195f7bffbab478833abe024b0e')
