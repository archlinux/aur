# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.18.18
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.18.18")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.18.18" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.18.18::https://storage.googleapis.com/kubernetes-release/release/v1.18.18/bin/linux/386/kubectl')
sha256sums_i686=('1d5bc7cfa83cfe074ff82107f1fd8b5c83a98eaa53f0f0fa7f638d6e1b73c40c')
source_x86_64=('kubectl-v1.18.18::https://storage.googleapis.com/kubernetes-release/release/v1.18.18/bin/linux/amd64/kubectl')
sha256sums_x86_64=('2c07bb3bb15e29c26344ab6671ebdf32e69a49182a7b4cd1229d1ff817f3abee')
source_armv5=('kubectl-v1.18.18::https://storage.googleapis.com/kubernetes-release/release/v1.18.18/bin/linux/arm/kubectl')
sha256sums_armv5=('aa8e05360621db4c897c6a7bac329f728c480bf9e984319707c2da60e7dd7ae1')
source_armv6h=('kubectl-v1.18.18::https://storage.googleapis.com/kubernetes-release/release/v1.18.18/bin/linux/arm/kubectl')
sha256sums_armv6h=('aa8e05360621db4c897c6a7bac329f728c480bf9e984319707c2da60e7dd7ae1')
source_armv7h=('kubectl-v1.18.18::https://storage.googleapis.com/kubernetes-release/release/v1.18.18/bin/linux/arm/kubectl')
sha256sums_armv7h=('aa8e05360621db4c897c6a7bac329f728c480bf9e984319707c2da60e7dd7ae1')
source_aarch64=('kubectl-v1.18.18::https://storage.googleapis.com/kubernetes-release/release/v1.18.18/bin/linux/arm64/kubectl')
sha256sums_aarch64=('bb3046e7b666a8c3380e47312bbf791cbf4a0d7db21ecd730c0e39491048e01a')
