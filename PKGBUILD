# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.18.20
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.18.20")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.18.20" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.18.20::https://storage.googleapis.com/kubernetes-release/release/v1.18.20/bin/linux/386/kubectl')
sha256sums_i686=('aeda69896636a31df0f8dfe9b83ae3e41fcbbba239297632ecaec6d446f48851')
source_x86_64=('kubectl-v1.18.20::https://storage.googleapis.com/kubernetes-release/release/v1.18.20/bin/linux/amd64/kubectl')
sha256sums_x86_64=('66a9bb8e9843050340844ca6e72e67632b75b9ebb651559c49db22f35450ed2f')
source_armv5=('kubectl-v1.18.20::https://storage.googleapis.com/kubernetes-release/release/v1.18.20/bin/linux/arm/kubectl')
sha256sums_armv5=('952692df5533e88f1aa8cff254c1bb9f50f45c425fbd5c75f8049218fb93d009')
source_armv6h=('kubectl-v1.18.20::https://storage.googleapis.com/kubernetes-release/release/v1.18.20/bin/linux/arm/kubectl')
sha256sums_armv6h=('952692df5533e88f1aa8cff254c1bb9f50f45c425fbd5c75f8049218fb93d009')
source_armv7h=('kubectl-v1.18.20::https://storage.googleapis.com/kubernetes-release/release/v1.18.20/bin/linux/arm/kubectl')
sha256sums_armv7h=('952692df5533e88f1aa8cff254c1bb9f50f45c425fbd5c75f8049218fb93d009')
source_aarch64=('kubectl-v1.18.20::https://storage.googleapis.com/kubernetes-release/release/v1.18.20/bin/linux/arm64/kubectl')
sha256sums_aarch64=('31e6bbc657b13ce1b932bf7589bca41a25b0612b4d897b1f363dc9c5a8080a22')
