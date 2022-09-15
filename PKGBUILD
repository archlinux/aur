# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.22.13
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.22.13")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.22.13" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.22.13::https://storage.googleapis.com/kubernetes-release/release/v1.22.13/bin/linux/386/kubectl')
sha256sums_i686=('28dc7b2ee95a3fc9ccb5220a8de5bb93ae3506ac04526580632781f93e45ed25')
source_x86_64=('kubectl-v1.22.13::https://storage.googleapis.com/kubernetes-release/release/v1.22.13/bin/linux/amd64/kubectl')
sha256sums_x86_64=('b96d2bc9137ec63546a29513c40c5d4f74e9f89aa11edc15e3c2f674d5fa3e02')
source_armv5=('kubectl-v1.22.13::https://storage.googleapis.com/kubernetes-release/release/v1.22.13/bin/linux/arm/kubectl')
sha256sums_armv5=('4228743e4e51403692cf9578b35f3550a769804011126a9be18536ac591e8dd2')
source_armv6h=('kubectl-v1.22.13::https://storage.googleapis.com/kubernetes-release/release/v1.22.13/bin/linux/arm/kubectl')
sha256sums_armv6h=('4228743e4e51403692cf9578b35f3550a769804011126a9be18536ac591e8dd2')
source_armv7h=('kubectl-v1.22.13::https://storage.googleapis.com/kubernetes-release/release/v1.22.13/bin/linux/arm/kubectl')
sha256sums_armv7h=('4228743e4e51403692cf9578b35f3550a769804011126a9be18536ac591e8dd2')
source_aarch64=('kubectl-v1.22.13::https://storage.googleapis.com/kubernetes-release/release/v1.22.13/bin/linux/arm64/kubectl')
sha256sums_aarch64=('e3e845bac0e1c30de20438433a8d75c64c237892245887a2818bd877b9601b41')
