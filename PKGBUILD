# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.21.13
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.21.13")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.21.13" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.21.13::https://storage.googleapis.com/kubernetes-release/release/v1.21.13/bin/linux/386/kubectl')
sha256sums_i686=('96bc00c15ce211d8a1fa56b6fe4f4583d867fda6738c1ca638dbc643f944c24e')
source_x86_64=('kubectl-v1.21.13::https://storage.googleapis.com/kubernetes-release/release/v1.21.13/bin/linux/amd64/kubectl')
sha256sums_x86_64=('24fc367b5add5a06713ea8103041f6fc0cf4560a17f2c17916e7930037adc84a')
source_armv5=('kubectl-v1.21.13::https://storage.googleapis.com/kubernetes-release/release/v1.21.13/bin/linux/arm/kubectl')
sha256sums_armv5=('7bd86656b5267d275dae5ff5ff81367a1dc8c1876e9cb253b83e2d566f059033')
source_armv6h=('kubectl-v1.21.13::https://storage.googleapis.com/kubernetes-release/release/v1.21.13/bin/linux/arm/kubectl')
sha256sums_armv6h=('7bd86656b5267d275dae5ff5ff81367a1dc8c1876e9cb253b83e2d566f059033')
source_armv7h=('kubectl-v1.21.13::https://storage.googleapis.com/kubernetes-release/release/v1.21.13/bin/linux/arm/kubectl')
sha256sums_armv7h=('7bd86656b5267d275dae5ff5ff81367a1dc8c1876e9cb253b83e2d566f059033')
source_aarch64=('kubectl-v1.21.13::https://storage.googleapis.com/kubernetes-release/release/v1.21.13/bin/linux/arm64/kubectl')
sha256sums_aarch64=('ca40722f3a3cb1b7687e5cdbd3a374b64ba4566e979e8ee6cd6023fa09f82ffe')
