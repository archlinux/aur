# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.17.13
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.17.13")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.17.13" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.17.13::https://storage.googleapis.com/kubernetes-release/release/v1.17.13/bin/linux/386/kubectl')
sha256sums_i686=('c4c9ae554b2351f242642917eaff378a15b82564063c17364162f306d28841c6')
source_x86_64=('kubectl-v1.17.13::https://storage.googleapis.com/kubernetes-release/release/v1.17.13/bin/linux/amd64/kubectl')
sha256sums_x86_64=('25824bf20d8d9501e9b6cabdd6bd25ec10cc649d4e3155dba86037f57bba842e')
source_armv5=('kubectl-v1.17.13::https://storage.googleapis.com/kubernetes-release/release/v1.17.13/bin/linux/arm/kubectl')
sha256sums_armv5=('1053624c88881d1fe9d8f2adbb07831fc23c829127b8466da9b15cc122004344')
source_armv6h=('kubectl-v1.17.13::https://storage.googleapis.com/kubernetes-release/release/v1.17.13/bin/linux/arm/kubectl')
sha256sums_armv6h=('1053624c88881d1fe9d8f2adbb07831fc23c829127b8466da9b15cc122004344')
source_armv7h=('kubectl-v1.17.13::https://storage.googleapis.com/kubernetes-release/release/v1.17.13/bin/linux/arm/kubectl')
sha256sums_armv7h=('1053624c88881d1fe9d8f2adbb07831fc23c829127b8466da9b15cc122004344')
source_aarch64=('kubectl-v1.17.13::https://storage.googleapis.com/kubernetes-release/release/v1.17.13/bin/linux/arm64/kubectl')
sha256sums_aarch64=('9d62bb6f21a64fd464237b7c81e45075e2ce0a83b6e13c54a6539c076f3b536f')
