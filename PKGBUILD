# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.19.16
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.19.16")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.19.16" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.19.16::https://storage.googleapis.com/kubernetes-release/release/v1.19.16/bin/linux/386/kubectl')
sha256sums_i686=('1629093b828f6608d2827b8b1a885c901e7317e2d0f3081b52d06e0ca9a387c2')
source_x86_64=('kubectl-v1.19.16::https://storage.googleapis.com/kubernetes-release/release/v1.19.16/bin/linux/amd64/kubectl')
sha256sums_x86_64=('6b9d9315877c624097630ac3c9a13f1f7603be39764001da7a080162f85cbc7e')
source_armv5=('kubectl-v1.19.16::https://storage.googleapis.com/kubernetes-release/release/v1.19.16/bin/linux/arm/kubectl')
sha256sums_armv5=('656a13ee34dac21c50911f309155fbb8641ce93a08c57d8187eeff7c74842b81')
source_armv6h=('kubectl-v1.19.16::https://storage.googleapis.com/kubernetes-release/release/v1.19.16/bin/linux/arm/kubectl')
sha256sums_armv6h=('656a13ee34dac21c50911f309155fbb8641ce93a08c57d8187eeff7c74842b81')
source_armv7h=('kubectl-v1.19.16::https://storage.googleapis.com/kubernetes-release/release/v1.19.16/bin/linux/arm/kubectl')
sha256sums_armv7h=('656a13ee34dac21c50911f309155fbb8641ce93a08c57d8187eeff7c74842b81')
source_aarch64=('kubectl-v1.19.16::https://storage.googleapis.com/kubernetes-release/release/v1.19.16/bin/linux/arm64/kubectl')
sha256sums_aarch64=('6ad55694db34b9ffbc3cb41761a50160eea0a962eb86899410593931b4e602d0')
