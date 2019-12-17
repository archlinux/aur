# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.14.10
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.14.10")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl" "$pkgdir/usr/bin/kubectl"
}

source_i686=('https://storage.googleapis.com/kubernetes-release/release/v1.14.10/bin/linux/386/kubectl')
sha256sums_i686=('cc656b0ba06741d2040f197183baeba3d7b9061d2df367cc843b0c789faa137e')
source_x86_64=('https://storage.googleapis.com/kubernetes-release/release/v1.14.10/bin/linux/amd64/kubectl')
sha256sums_x86_64=('7729c6612bec76badc7926a79b26e0d9b06cc312af46dbb80ea7416d1fce0b36')
source_armv5=('https://storage.googleapis.com/kubernetes-release/release/v1.14.10/bin/linux/arm/kubectl')
sha256sums_armv5=('2bdd1718b63d27bb895b952bffb52d37f2c0ead1736512b3fea87df5a1497913')
source_armv6h=('https://storage.googleapis.com/kubernetes-release/release/v1.14.10/bin/linux/arm/kubectl')
sha256sums_armv6h=('2bdd1718b63d27bb895b952bffb52d37f2c0ead1736512b3fea87df5a1497913')
source_armv7h=('https://storage.googleapis.com/kubernetes-release/release/v1.14.10/bin/linux/arm/kubectl')
sha256sums_armv7h=('2bdd1718b63d27bb895b952bffb52d37f2c0ead1736512b3fea87df5a1497913')
source_aarch64=('https://storage.googleapis.com/kubernetes-release/release/v1.14.10/bin/linux/arm64/kubectl')
sha256sums_aarch64=('7927cfdbf6c793626d0e437ca2c45dd2c1431b6629193ef17f798e81a76b4234')
