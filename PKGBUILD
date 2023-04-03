# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-regular-bin
pkgver=v1.21.14
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the regular channel'
provides=("kubectl=v1.21.14")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.21.14" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.21.14::https://storage.googleapis.com/kubernetes-release/release/v1.21.14/bin/linux/386/kubectl')
sha256sums_i686=('233560c7ea56d490bbe086990884250f391604ef54c178e8edfeefb27c932403')
source_x86_64=('kubectl-v1.21.14::https://storage.googleapis.com/kubernetes-release/release/v1.21.14/bin/linux/amd64/kubectl')
sha256sums_x86_64=('0c1682493c2abd7bc5fe4ddcdb0b6e5d417aa7e067994ffeca964163a988c6ee')
source_armv5=('kubectl-v1.21.14::https://storage.googleapis.com/kubernetes-release/release/v1.21.14/bin/linux/arm/kubectl')
sha256sums_armv5=('92ec12abb063b6469968d9cbf1a6fb86e4ebf2c8be8dc833a999c79d7226be6f')
source_armv6h=('kubectl-v1.21.14::https://storage.googleapis.com/kubernetes-release/release/v1.21.14/bin/linux/arm/kubectl')
sha256sums_armv6h=('92ec12abb063b6469968d9cbf1a6fb86e4ebf2c8be8dc833a999c79d7226be6f')
source_armv7h=('kubectl-v1.21.14::https://storage.googleapis.com/kubernetes-release/release/v1.21.14/bin/linux/arm/kubectl')
sha256sums_armv7h=('92ec12abb063b6469968d9cbf1a6fb86e4ebf2c8be8dc833a999c79d7226be6f')
source_aarch64=('kubectl-v1.21.14::https://storage.googleapis.com/kubernetes-release/release/v1.21.14/bin/linux/arm64/kubectl')
sha256sums_aarch64=('a23151bca5d918e9238546e7af416422b51cda597a22abaae5ca50369abfbbaa')
