# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.22.17
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.22.17")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.22.17" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.22.17::https://storage.googleapis.com/kubernetes-release/release/v1.22.17/bin/linux/386/kubectl')
sha256sums_i686=('7ecae939aae46ce6a708506059951d8c4de6b932614138affeff4f3681f519a3')
source_x86_64=('kubectl-v1.22.17::https://storage.googleapis.com/kubernetes-release/release/v1.22.17/bin/linux/amd64/kubectl')
sha256sums_x86_64=('7506a0ae7a59b35089853e1da2b0b9ac0258c5309ea3d165c3412904a9051d48')
source_armv5=('kubectl-v1.22.17::https://storage.googleapis.com/kubernetes-release/release/v1.22.17/bin/linux/arm/kubectl')
sha256sums_armv5=('ffbde63bd66f6ac6331e61688c95dabe647fe5e41111f99a88cc5e7acbb0bf08')
source_armv6h=('kubectl-v1.22.17::https://storage.googleapis.com/kubernetes-release/release/v1.22.17/bin/linux/arm/kubectl')
sha256sums_armv6h=('ffbde63bd66f6ac6331e61688c95dabe647fe5e41111f99a88cc5e7acbb0bf08')
source_armv7h=('kubectl-v1.22.17::https://storage.googleapis.com/kubernetes-release/release/v1.22.17/bin/linux/arm/kubectl')
sha256sums_armv7h=('ffbde63bd66f6ac6331e61688c95dabe647fe5e41111f99a88cc5e7acbb0bf08')
source_aarch64=('kubectl-v1.22.17::https://storage.googleapis.com/kubernetes-release/release/v1.22.17/bin/linux/arm64/kubectl')
sha256sums_aarch64=('8fc2f8d5c80a6bf60be06f8cf28679a05ce565ce0bc81e70aaac38e0f7da6259')
