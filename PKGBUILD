# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.17.16
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.17.16")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.17.16" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.17.16::https://storage.googleapis.com/kubernetes-release/release/v1.17.16/bin/linux/386/kubectl')
sha256sums_i686=('de485b7fa6d473c3a97a9fb70377ae4c3bc14731242a7de48eaebfa95d489574')
source_x86_64=('kubectl-v1.17.16::https://storage.googleapis.com/kubernetes-release/release/v1.17.16/bin/linux/amd64/kubectl')
sha256sums_x86_64=('5c7cd1838c23be488e98f5f69cf8c0bd1b66ccf402d5bbfe54cf6674aa554b36')
source_armv5=('kubectl-v1.17.16::https://storage.googleapis.com/kubernetes-release/release/v1.17.16/bin/linux/arm/kubectl')
sha256sums_armv5=('9f4972952f22d018e6e04887ecf5e49656f5aabefab5522b523774bbfaca26de')
source_armv6h=('kubectl-v1.17.16::https://storage.googleapis.com/kubernetes-release/release/v1.17.16/bin/linux/arm/kubectl')
sha256sums_armv6h=('9f4972952f22d018e6e04887ecf5e49656f5aabefab5522b523774bbfaca26de')
source_armv7h=('kubectl-v1.17.16::https://storage.googleapis.com/kubernetes-release/release/v1.17.16/bin/linux/arm/kubectl')
sha256sums_armv7h=('9f4972952f22d018e6e04887ecf5e49656f5aabefab5522b523774bbfaca26de')
source_aarch64=('kubectl-v1.17.16::https://storage.googleapis.com/kubernetes-release/release/v1.17.16/bin/linux/arm64/kubectl')
sha256sums_aarch64=('ac81bf5a06cbc2a23b7073f28a52d4d3e82dc2f23218b8620c401f1dc3258dea')
