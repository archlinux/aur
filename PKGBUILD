# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.22.14
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.22.14")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.22.14" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.22.14::https://storage.googleapis.com/kubernetes-release/release/v1.22.14/bin/linux/386/kubectl')
sha256sums_i686=('2ef461e13408e6d7491da6b3fa6e53a9818ea05a42809f3819ddcf7370341fd3')
source_x86_64=('kubectl-v1.22.14::https://storage.googleapis.com/kubernetes-release/release/v1.22.14/bin/linux/amd64/kubectl')
sha256sums_x86_64=('a4408b32b9729e38c14b38a64ea6f00d67d2127f9c1314fbc2273a37a987a2d2')
source_armv5=('kubectl-v1.22.14::https://storage.googleapis.com/kubernetes-release/release/v1.22.14/bin/linux/arm/kubectl')
sha256sums_armv5=('f8dd8db49ec02d9095ec0ac5409f498505748cfbb6b394addaa6401be2403680')
source_armv6h=('kubectl-v1.22.14::https://storage.googleapis.com/kubernetes-release/release/v1.22.14/bin/linux/arm/kubectl')
sha256sums_armv6h=('f8dd8db49ec02d9095ec0ac5409f498505748cfbb6b394addaa6401be2403680')
source_armv7h=('kubectl-v1.22.14::https://storage.googleapis.com/kubernetes-release/release/v1.22.14/bin/linux/arm/kubectl')
sha256sums_armv7h=('f8dd8db49ec02d9095ec0ac5409f498505748cfbb6b394addaa6401be2403680')
source_aarch64=('kubectl-v1.22.14::https://storage.googleapis.com/kubernetes-release/release/v1.22.14/bin/linux/arm64/kubectl')
sha256sums_aarch64=('942c5f0e7be658ed047d8691df3f80cf1dd00a642fb7eab5c5367cb2f8e937e6')
