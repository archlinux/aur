# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.20.13
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.20.13")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.20.13" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.20.13::https://storage.googleapis.com/kubernetes-release/release/v1.20.13/bin/linux/386/kubectl')
sha256sums_i686=('e57787c49114f7effccc6e754ca869afb383c6695f4a42e406103fd577e9355e')
source_x86_64=('kubectl-v1.20.13::https://storage.googleapis.com/kubernetes-release/release/v1.20.13/bin/linux/amd64/kubectl')
sha256sums_x86_64=('0ea0e50382bb16a134b812caba15f7b9bb805ca21a593c8958a94aa0a09509cd')
source_armv5=('kubectl-v1.20.13::https://storage.googleapis.com/kubernetes-release/release/v1.20.13/bin/linux/arm/kubectl')
sha256sums_armv5=('2026bee7860bf299b39cf650a0c7564306063f0529570e78a8762f09751826ea')
source_armv6h=('kubectl-v1.20.13::https://storage.googleapis.com/kubernetes-release/release/v1.20.13/bin/linux/arm/kubectl')
sha256sums_armv6h=('2026bee7860bf299b39cf650a0c7564306063f0529570e78a8762f09751826ea')
source_armv7h=('kubectl-v1.20.13::https://storage.googleapis.com/kubernetes-release/release/v1.20.13/bin/linux/arm/kubectl')
sha256sums_armv7h=('2026bee7860bf299b39cf650a0c7564306063f0529570e78a8762f09751826ea')
source_aarch64=('kubectl-v1.20.13::https://storage.googleapis.com/kubernetes-release/release/v1.20.13/bin/linux/arm64/kubectl')
sha256sums_aarch64=('e58610d292120d0d8ebb098f2ef9d15a63dbedbf2be36e820e48eca97bf836f9')
