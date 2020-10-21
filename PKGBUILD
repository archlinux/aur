# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.18.10
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.18.10")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.18.10" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.18.10::https://storage.googleapis.com/kubernetes-release/release/v1.18.10/bin/linux/386/kubectl')
sha256sums_i686=('e0c5f3967dc57589c70c95258bd42613736eee32c9c2fc98258f7993e1cb6803')
source_x86_64=('kubectl-v1.18.10::https://storage.googleapis.com/kubernetes-release/release/v1.18.10/bin/linux/amd64/kubectl')
sha256sums_x86_64=('b25c445cb36ab168de590c13b50bced4e7877ed15ca899a261053b4ba3ba1456')
source_armv5=('kubectl-v1.18.10::https://storage.googleapis.com/kubernetes-release/release/v1.18.10/bin/linux/arm/kubectl')
sha256sums_armv5=('3d5b7cb1c54d5e9dec157a512d2d21dddc6b9fd5b9a0b8df9493553871d21668')
source_armv6h=('kubectl-v1.18.10::https://storage.googleapis.com/kubernetes-release/release/v1.18.10/bin/linux/arm/kubectl')
sha256sums_armv6h=('3d5b7cb1c54d5e9dec157a512d2d21dddc6b9fd5b9a0b8df9493553871d21668')
source_armv7h=('kubectl-v1.18.10::https://storage.googleapis.com/kubernetes-release/release/v1.18.10/bin/linux/arm/kubectl')
sha256sums_armv7h=('3d5b7cb1c54d5e9dec157a512d2d21dddc6b9fd5b9a0b8df9493553871d21668')
source_aarch64=('kubectl-v1.18.10::https://storage.googleapis.com/kubernetes-release/release/v1.18.10/bin/linux/arm64/kubectl')
sha256sums_aarch64=('394fa475f7688778eeeecb31e01acfae4cc37a72926d9bf33290c968e6dc037a')
