# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.19.14
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.19.14")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.19.14" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.19.14::https://storage.googleapis.com/kubernetes-release/release/v1.19.14/bin/linux/386/kubectl')
sha256sums_i686=('f485590dac9e0e7fa183b190044dfac934a3dc6d9dbdbe66d07eb44a3b8a8cf9')
source_x86_64=('kubectl-v1.19.14::https://storage.googleapis.com/kubernetes-release/release/v1.19.14/bin/linux/amd64/kubectl')
sha256sums_x86_64=('de2279c5a369f16fe6226e0358c5f8627a2dbee904f5c9b6c894158279df277d')
source_armv5=('kubectl-v1.19.14::https://storage.googleapis.com/kubernetes-release/release/v1.19.14/bin/linux/arm/kubectl')
sha256sums_armv5=('6e08274423ff534310779ffc3f2bdfafaca88d56dba95adc7a75a87e109f3989')
source_armv6h=('kubectl-v1.19.14::https://storage.googleapis.com/kubernetes-release/release/v1.19.14/bin/linux/arm/kubectl')
sha256sums_armv6h=('6e08274423ff534310779ffc3f2bdfafaca88d56dba95adc7a75a87e109f3989')
source_armv7h=('kubectl-v1.19.14::https://storage.googleapis.com/kubernetes-release/release/v1.19.14/bin/linux/arm/kubectl')
sha256sums_armv7h=('6e08274423ff534310779ffc3f2bdfafaca88d56dba95adc7a75a87e109f3989')
source_aarch64=('kubectl-v1.19.14::https://storage.googleapis.com/kubernetes-release/release/v1.19.14/bin/linux/arm64/kubectl')
sha256sums_aarch64=('75de4de6d3bb3c16c5ef2c4505fd1d8009fcd2f3bfa7f69e23acd547d92eda49')
