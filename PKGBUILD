# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.20.15
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.20.15")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.20.15" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.20.15::https://storage.googleapis.com/kubernetes-release/release/v1.20.15/bin/linux/386/kubectl')
sha256sums_i686=('94e89059896abdea34fc17d5ee799b473dc6e0f008435f3432ad79daac8a4297')
source_x86_64=('kubectl-v1.20.15::https://storage.googleapis.com/kubernetes-release/release/v1.20.15/bin/linux/amd64/kubectl')
sha256sums_x86_64=('d283552d3ef3b0fd47c08953414e1e73897a1b3f88c8a520bb2e7de4e37e96f3')
source_armv5=('kubectl-v1.20.15::https://storage.googleapis.com/kubernetes-release/release/v1.20.15/bin/linux/arm/kubectl')
sha256sums_armv5=('9c32db99c544a4e3d11172ff11d166cc61cf839b9d8280cdbd1c0d2dd8cfe1b8')
source_armv6h=('kubectl-v1.20.15::https://storage.googleapis.com/kubernetes-release/release/v1.20.15/bin/linux/arm/kubectl')
sha256sums_armv6h=('9c32db99c544a4e3d11172ff11d166cc61cf839b9d8280cdbd1c0d2dd8cfe1b8')
source_armv7h=('kubectl-v1.20.15::https://storage.googleapis.com/kubernetes-release/release/v1.20.15/bin/linux/arm/kubectl')
sha256sums_armv7h=('9c32db99c544a4e3d11172ff11d166cc61cf839b9d8280cdbd1c0d2dd8cfe1b8')
source_aarch64=('kubectl-v1.20.15::https://storage.googleapis.com/kubernetes-release/release/v1.20.15/bin/linux/arm64/kubectl')
sha256sums_aarch64=('d479febfb2e967bd86240b5c0b841e40e39e1ef610afd6f224281a23318c13dc')
