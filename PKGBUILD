# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.18.19
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.18.19")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.18.19" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.18.19::https://storage.googleapis.com/kubernetes-release/release/v1.18.19/bin/linux/386/kubectl')
sha256sums_i686=('fd51b48a91bdff6552fa856d6addedb260509ecbb6f0518a9eb61c5bc9e89221')
source_x86_64=('kubectl-v1.18.19::https://storage.googleapis.com/kubernetes-release/release/v1.18.19/bin/linux/amd64/kubectl')
sha256sums_x86_64=('332820433bc7695801bcf6e8444856fc7daae97fc9261b918d491110d67be116')
source_armv5=('kubectl-v1.18.19::https://storage.googleapis.com/kubernetes-release/release/v1.18.19/bin/linux/arm/kubectl')
sha256sums_armv5=('e02c003c47c8cd38f9daba658cd562b4abc82232caced2b4c2740166c79ca7a3')
source_armv6h=('kubectl-v1.18.19::https://storage.googleapis.com/kubernetes-release/release/v1.18.19/bin/linux/arm/kubectl')
sha256sums_armv6h=('e02c003c47c8cd38f9daba658cd562b4abc82232caced2b4c2740166c79ca7a3')
source_armv7h=('kubectl-v1.18.19::https://storage.googleapis.com/kubernetes-release/release/v1.18.19/bin/linux/arm/kubectl')
sha256sums_armv7h=('e02c003c47c8cd38f9daba658cd562b4abc82232caced2b4c2740166c79ca7a3')
source_aarch64=('kubectl-v1.18.19::https://storage.googleapis.com/kubernetes-release/release/v1.18.19/bin/linux/arm64/kubectl')
sha256sums_aarch64=('c842438abcb099a5801be3a278f567b73250d293fb98866f9b24e234213be790')
