# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.16.15
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.16.15")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.16.15" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.16.15::https://storage.googleapis.com/kubernetes-release/release/v1.16.15/bin/linux/386/kubectl')
sha256sums_i686=('06fa3eaa9e17766dc84e52df39e0d2176a62f5a41f27bc9f08f68398a33f8480')
source_x86_64=('kubectl-v1.16.15::https://storage.googleapis.com/kubernetes-release/release/v1.16.15/bin/linux/amd64/kubectl')
sha256sums_x86_64=('e8913069293156ddf55f243814a22d2384fc18b165efb6200606fdeaad146605')
source_armv5=('kubectl-v1.16.15::https://storage.googleapis.com/kubernetes-release/release/v1.16.15/bin/linux/arm/kubectl')
sha256sums_armv5=('23436a1b74b535338543cb6e8a202d2cf62881479971393fabff0e692a1ec677')
source_armv6h=('kubectl-v1.16.15::https://storage.googleapis.com/kubernetes-release/release/v1.16.15/bin/linux/arm/kubectl')
sha256sums_armv6h=('23436a1b74b535338543cb6e8a202d2cf62881479971393fabff0e692a1ec677')
source_armv7h=('kubectl-v1.16.15::https://storage.googleapis.com/kubernetes-release/release/v1.16.15/bin/linux/arm/kubectl')
sha256sums_armv7h=('23436a1b74b535338543cb6e8a202d2cf62881479971393fabff0e692a1ec677')
source_aarch64=('kubectl-v1.16.15::https://storage.googleapis.com/kubernetes-release/release/v1.16.15/bin/linux/arm64/kubectl')
sha256sums_aarch64=('74719f137dc6d589a3b8a667bcb0f3c57eebd8f050dd2f7ad5b59ceb892a7b99')
