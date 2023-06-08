# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.25.10
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.25.10")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.25.10" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.25.10::https://storage.googleapis.com/kubernetes-release/release/v1.25.10/bin/linux/386/kubectl')
sha256sums_i686=('e1ca9cb3ed74d8d3b2fb1135e7a5d718c73e73bdef72d1e0bbce7e40165267c0')
source_x86_64=('kubectl-v1.25.10::https://storage.googleapis.com/kubernetes-release/release/v1.25.10/bin/linux/amd64/kubectl')
sha256sums_x86_64=('62129056c9e390b23253aadfce1fe23e43316cb3d79a73303d687d86d73707f2')
source_armv5=('kubectl-v1.25.10::https://storage.googleapis.com/kubernetes-release/release/v1.25.10/bin/linux/arm/kubectl')
sha256sums_armv5=('252dcefaa23709524db6554870877831c6208f1023beca6fb2dd2bb3d271673b')
source_armv6h=('kubectl-v1.25.10::https://storage.googleapis.com/kubernetes-release/release/v1.25.10/bin/linux/arm/kubectl')
sha256sums_armv6h=('252dcefaa23709524db6554870877831c6208f1023beca6fb2dd2bb3d271673b')
source_armv7h=('kubectl-v1.25.10::https://storage.googleapis.com/kubernetes-release/release/v1.25.10/bin/linux/arm/kubectl')
sha256sums_armv7h=('252dcefaa23709524db6554870877831c6208f1023beca6fb2dd2bb3d271673b')
source_aarch64=('kubectl-v1.25.10::https://storage.googleapis.com/kubernetes-release/release/v1.25.10/bin/linux/arm64/kubectl')
sha256sums_aarch64=('d5ade4f3962dc89ac80fb47010231f79b3f83b2c9569183941c0189157e514fa')
