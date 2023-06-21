# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.24.15
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.24.15")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.24.15" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.24.15::https://storage.googleapis.com/kubernetes-release/release/v1.24.15/bin/linux/386/kubectl')
sha256sums_i686=('868d44809ff4fa0fd4f18878512b97b9eb33898a3f121420d1bdca3936dc998c')
source_x86_64=('kubectl-v1.24.15::https://storage.googleapis.com/kubernetes-release/release/v1.24.15/bin/linux/amd64/kubectl')
sha256sums_x86_64=('a45d390e17d1cd4bf93eaa733ebc87ed1a38fd867316919bdc59bee9f96e4d8e')
source_armv5=('kubectl-v1.24.15::https://storage.googleapis.com/kubernetes-release/release/v1.24.15/bin/linux/arm/kubectl')
sha256sums_armv5=('f2761d1222d7a64bb3cf2c26e024f61448e8c19d0913957711c950dbe379c058')
source_armv6h=('kubectl-v1.24.15::https://storage.googleapis.com/kubernetes-release/release/v1.24.15/bin/linux/arm/kubectl')
sha256sums_armv6h=('f2761d1222d7a64bb3cf2c26e024f61448e8c19d0913957711c950dbe379c058')
source_armv7h=('kubectl-v1.24.15::https://storage.googleapis.com/kubernetes-release/release/v1.24.15/bin/linux/arm/kubectl')
sha256sums_armv7h=('f2761d1222d7a64bb3cf2c26e024f61448e8c19d0913957711c950dbe379c058')
source_aarch64=('kubectl-v1.24.15::https://storage.googleapis.com/kubernetes-release/release/v1.24.15/bin/linux/arm64/kubectl')
sha256sums_aarch64=('49f794a719d2e5c6cc1fbd19c45603e5e62e828be216975e4ae1a71eacba78f2')
