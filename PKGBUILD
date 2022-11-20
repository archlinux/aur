# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.22.16
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.22.16")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.22.16" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.22.16::https://storage.googleapis.com/kubernetes-release/release/v1.22.16/bin/linux/386/kubectl')
sha256sums_i686=('15fe811add5ebd54fceaa1ee82e1bc108e1cbca885d8d72f908a445290f6f05a')
source_x86_64=('kubectl-v1.22.16::https://storage.googleapis.com/kubernetes-release/release/v1.22.16/bin/linux/amd64/kubectl')
sha256sums_x86_64=('12da5128e2377f9c9eb97b854c95445e00839437de0543968bd3a54b5ae596d8')
source_armv5=('kubectl-v1.22.16::https://storage.googleapis.com/kubernetes-release/release/v1.22.16/bin/linux/arm/kubectl')
sha256sums_armv5=('ba8e5c6a857f67d7ff95ae2c5116786a1d83ef3f8273b84440f85a3d4248c896')
source_armv6h=('kubectl-v1.22.16::https://storage.googleapis.com/kubernetes-release/release/v1.22.16/bin/linux/arm/kubectl')
sha256sums_armv6h=('ba8e5c6a857f67d7ff95ae2c5116786a1d83ef3f8273b84440f85a3d4248c896')
source_armv7h=('kubectl-v1.22.16::https://storage.googleapis.com/kubernetes-release/release/v1.22.16/bin/linux/arm/kubectl')
sha256sums_armv7h=('ba8e5c6a857f67d7ff95ae2c5116786a1d83ef3f8273b84440f85a3d4248c896')
source_aarch64=('kubectl-v1.22.16::https://storage.googleapis.com/kubernetes-release/release/v1.22.16/bin/linux/arm64/kubectl')
sha256sums_aarch64=('70b9cd23bde136f22510f75216ce9e97944b595f2f5193eca63ffab7bfbe683e')
