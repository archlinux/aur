# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.26.7
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.26.7")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.26.7" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.26.7::https://storage.googleapis.com/kubernetes-release/release/v1.26.7/bin/linux/386/kubectl')
sha256sums_i686=('e7e7b39af00062fdbd6dae5bf5cf315988072619e79ac59787bff72bdf900e9a')
source_x86_64=('kubectl-v1.26.7::https://storage.googleapis.com/kubernetes-release/release/v1.26.7/bin/linux/amd64/kubectl')
sha256sums_x86_64=('d9dc7741e5f279c28ef32fbbe1daa8ebc36622391c33470efed5eb8426959971')
source_armv5=('kubectl-v1.26.7::https://storage.googleapis.com/kubernetes-release/release/v1.26.7/bin/linux/arm/kubectl')
sha256sums_armv5=('ad796f714102a78a4f4dfa8f49a3c11cb31a9d74965d6b14f84ef5adb065ed69')
source_armv6h=('kubectl-v1.26.7::https://storage.googleapis.com/kubernetes-release/release/v1.26.7/bin/linux/arm/kubectl')
sha256sums_armv6h=('ad796f714102a78a4f4dfa8f49a3c11cb31a9d74965d6b14f84ef5adb065ed69')
source_armv7h=('kubectl-v1.26.7::https://storage.googleapis.com/kubernetes-release/release/v1.26.7/bin/linux/arm/kubectl')
sha256sums_armv7h=('ad796f714102a78a4f4dfa8f49a3c11cb31a9d74965d6b14f84ef5adb065ed69')
source_aarch64=('kubectl-v1.26.7::https://storage.googleapis.com/kubernetes-release/release/v1.26.7/bin/linux/arm64/kubectl')
sha256sums_aarch64=('71edc4c6838a7332e5f82abb35642ce7f905059a258690b0a585d3ed6de285b3')
