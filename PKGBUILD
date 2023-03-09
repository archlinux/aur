# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.24.11
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.24.11")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.24.11" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.24.11::https://storage.googleapis.com/kubernetes-release/release/v1.24.11/bin/linux/386/kubectl')
sha256sums_i686=('69d356f42de3c452ce874f555811e4409d422780ee76ab26e6da0cad18140ad7')
source_x86_64=('kubectl-v1.24.11::https://storage.googleapis.com/kubernetes-release/release/v1.24.11/bin/linux/amd64/kubectl')
sha256sums_x86_64=('c8bdf1b12d5ac91d163c07e61b9527ef718bec6a00f4fd4cf071591218f59be5')
source_armv5=('kubectl-v1.24.11::https://storage.googleapis.com/kubernetes-release/release/v1.24.11/bin/linux/arm/kubectl')
sha256sums_armv5=('75e5d2bfd3975ad5d5930c560be87d1929ed5980f92d0424d41cd9dadd732197')
source_armv6h=('kubectl-v1.24.11::https://storage.googleapis.com/kubernetes-release/release/v1.24.11/bin/linux/arm/kubectl')
sha256sums_armv6h=('75e5d2bfd3975ad5d5930c560be87d1929ed5980f92d0424d41cd9dadd732197')
source_armv7h=('kubectl-v1.24.11::https://storage.googleapis.com/kubernetes-release/release/v1.24.11/bin/linux/arm/kubectl')
sha256sums_armv7h=('75e5d2bfd3975ad5d5930c560be87d1929ed5980f92d0424d41cd9dadd732197')
source_aarch64=('kubectl-v1.24.11::https://storage.googleapis.com/kubernetes-release/release/v1.24.11/bin/linux/arm64/kubectl')
sha256sums_aarch64=('b333f110a0408448b8ba18aa41ca40571056c78e496762ee8084e741b685e206')
