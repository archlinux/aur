# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.16.4
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.16.4")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl" "$pkgdir/usr/bin/kubectl"
}

source_i686=('https://storage.googleapis.com/kubernetes-release/release/v1.16.4/bin/linux/386/kubectl')
sha256sums_i686=('2c1a305321f03053a721da8477b62e900859d929c32621e6936de84a6513963c')
source_x86_64=('https://storage.googleapis.com/kubernetes-release/release/v1.16.4/bin/linux/amd64/kubectl')
sha256sums_x86_64=('bbb2030487ba0570227a48c6faac1b09cad03748f5508c567d078d20feca2df2')
source_armv5=('https://storage.googleapis.com/kubernetes-release/release/v1.16.4/bin/linux/arm/kubectl')
sha256sums_armv5=('058c0a3b6977db24ab60729cb7a09d7581b285f5c647c144f94e978fe7c7ce93')
source_armv6h=('https://storage.googleapis.com/kubernetes-release/release/v1.16.4/bin/linux/arm/kubectl')
sha256sums_armv6h=('058c0a3b6977db24ab60729cb7a09d7581b285f5c647c144f94e978fe7c7ce93')
source_armv7h=('https://storage.googleapis.com/kubernetes-release/release/v1.16.4/bin/linux/arm/kubectl')
sha256sums_armv7h=('058c0a3b6977db24ab60729cb7a09d7581b285f5c647c144f94e978fe7c7ce93')
source_aarch64=('https://storage.googleapis.com/kubernetes-release/release/v1.16.4/bin/linux/arm64/kubectl')
sha256sums_aarch64=('57767b74d03371f66fdf95265b7e85bd765d5f603eba3b68a020160a106e316c')
