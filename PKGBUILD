# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.23.15
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.23.15")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.23.15" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.23.15::https://storage.googleapis.com/kubernetes-release/release/v1.23.15/bin/linux/386/kubectl')
sha256sums_i686=('6bf149bd583ad4f1d6f1fb79b147529c4522b078d19a34337c428534686ca754')
source_x86_64=('kubectl-v1.23.15::https://storage.googleapis.com/kubernetes-release/release/v1.23.15/bin/linux/amd64/kubectl')
sha256sums_x86_64=('adab29cf67e04e48f566ce185e3904b5deb389ae1e4d57548fcf8947a49a26f5')
source_armv5=('kubectl-v1.23.15::https://storage.googleapis.com/kubernetes-release/release/v1.23.15/bin/linux/arm/kubectl')
sha256sums_armv5=('0fe6641715ee98a3d8899edd539322fa07762f8d65a35db23184ef06c1ff8111')
source_armv6h=('kubectl-v1.23.15::https://storage.googleapis.com/kubernetes-release/release/v1.23.15/bin/linux/arm/kubectl')
sha256sums_armv6h=('0fe6641715ee98a3d8899edd539322fa07762f8d65a35db23184ef06c1ff8111')
source_armv7h=('kubectl-v1.23.15::https://storage.googleapis.com/kubernetes-release/release/v1.23.15/bin/linux/arm/kubectl')
sha256sums_armv7h=('0fe6641715ee98a3d8899edd539322fa07762f8d65a35db23184ef06c1ff8111')
source_aarch64=('kubectl-v1.23.15::https://storage.googleapis.com/kubernetes-release/release/v1.23.15/bin/linux/arm64/kubectl')
sha256sums_aarch64=('f619f8b4811d60edef692f1d888609cc279a7d8223e50e1c0dc959c7b9250e79')
