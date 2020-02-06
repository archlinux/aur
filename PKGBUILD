# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.16.6
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.16.6")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl" "$pkgdir/usr/bin/kubectl"
}

source_i686=('https://storage.googleapis.com/kubernetes-release/release/v1.16.6/bin/linux/386/kubectl')
sha256sums_i686=('23a31fd8c8e393e05cf5b8fe4c63ab233c04bdc1d9aaf0ed2bd09b3ce5212d71')
source_x86_64=('https://storage.googleapis.com/kubernetes-release/release/v1.16.6/bin/linux/amd64/kubectl')
sha256sums_x86_64=('05aae29c6e96fc07db195878263d3b625b623b9f16f87851e4a8ed8d234bcc2d')
source_armv5=('https://storage.googleapis.com/kubernetes-release/release/v1.16.6/bin/linux/arm/kubectl')
sha256sums_armv5=('57b37697e4fae53b68786eaef5a2ea14cca38f62e9478aebd758648370c64608')
source_armv6h=('https://storage.googleapis.com/kubernetes-release/release/v1.16.6/bin/linux/arm/kubectl')
sha256sums_armv6h=('57b37697e4fae53b68786eaef5a2ea14cca38f62e9478aebd758648370c64608')
source_armv7h=('https://storage.googleapis.com/kubernetes-release/release/v1.16.6/bin/linux/arm/kubectl')
sha256sums_armv7h=('57b37697e4fae53b68786eaef5a2ea14cca38f62e9478aebd758648370c64608')
source_aarch64=('https://storage.googleapis.com/kubernetes-release/release/v1.16.6/bin/linux/arm64/kubectl')
sha256sums_aarch64=('4b852e138a3adc8378ab6ce863144b328924535cc118e33eb1d6245af81a0fbb')
