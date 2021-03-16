# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.18.16
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.18.16")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.18.16" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.18.16::https://storage.googleapis.com/kubernetes-release/release/v1.18.16/bin/linux/386/kubectl')
sha256sums_i686=('c3c30634a241cd2097e8273a967f2258eca4b92f6830dce2b324fd173fa259dc')
source_x86_64=('kubectl-v1.18.16::https://storage.googleapis.com/kubernetes-release/release/v1.18.16/bin/linux/amd64/kubectl')
sha256sums_x86_64=('3e8cd55186ffe461f383af06cbbab2bfe5dd75def1d699523c53ee8b11b8c91a')
source_armv5=('kubectl-v1.18.16::https://storage.googleapis.com/kubernetes-release/release/v1.18.16/bin/linux/arm/kubectl')
sha256sums_armv5=('a6eb328325fd2b2f3c254e6a97407df265caca39292a05993b5ef997bc2a55f3')
source_armv6h=('kubectl-v1.18.16::https://storage.googleapis.com/kubernetes-release/release/v1.18.16/bin/linux/arm/kubectl')
sha256sums_armv6h=('a6eb328325fd2b2f3c254e6a97407df265caca39292a05993b5ef997bc2a55f3')
source_armv7h=('kubectl-v1.18.16::https://storage.googleapis.com/kubernetes-release/release/v1.18.16/bin/linux/arm/kubectl')
sha256sums_armv7h=('a6eb328325fd2b2f3c254e6a97407df265caca39292a05993b5ef997bc2a55f3')
source_aarch64=('kubectl-v1.18.16::https://storage.googleapis.com/kubernetes-release/release/v1.18.16/bin/linux/arm64/kubectl')
sha256sums_aarch64=('c6dbc057558cbb202eaa37cf5a414e07dd01f95ddeec8d3789ad53c7cfcfece9')
