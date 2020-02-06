# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.15.9
pkgrel=3
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.15.9")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.15.9" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.15.9::https://storage.googleapis.com/kubernetes-release/release/v1.15.9/bin/linux/386/kubectl')
sha256sums_i686=('c8604abf6b139e603d41c227e7e98ad0f215b7444285f65006c31a6415178583')
source_x86_64=('kubectl-v1.15.9::https://storage.googleapis.com/kubernetes-release/release/v1.15.9/bin/linux/amd64/kubectl')
sha256sums_x86_64=('4475f68c51af23925d7bd7fc3d1bd01bedd3d4ccbb64503517d586e31d6f607c')
source_armv5=('kubectl-v1.15.9::https://storage.googleapis.com/kubernetes-release/release/v1.15.9/bin/linux/arm/kubectl')
sha256sums_armv5=('cf87205b4daff4509abd02a7ba9cc70e5c60666ed11621cb4caa03f3528e2bd0')
source_armv6h=('kubectl-v1.15.9::https://storage.googleapis.com/kubernetes-release/release/v1.15.9/bin/linux/arm/kubectl')
sha256sums_armv6h=('cf87205b4daff4509abd02a7ba9cc70e5c60666ed11621cb4caa03f3528e2bd0')
source_armv7h=('kubectl-v1.15.9::https://storage.googleapis.com/kubernetes-release/release/v1.15.9/bin/linux/arm/kubectl')
sha256sums_armv7h=('cf87205b4daff4509abd02a7ba9cc70e5c60666ed11621cb4caa03f3528e2bd0')
source_aarch64=('kubectl-v1.15.9::https://storage.googleapis.com/kubernetes-release/release/v1.15.9/bin/linux/arm64/kubectl')
sha256sums_aarch64=('4fac0a403d71e47ded2f891000c015fa7f0ffcebf619ee24ac210a6e046c740d')
