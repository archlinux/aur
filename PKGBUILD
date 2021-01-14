# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-rapid-bin
pkgver=v1.18.15
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the rapid channel'
provides=("kubectl=v1.18.15")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl-v1.18.15" "$pkgdir/usr/bin/kubectl"
}

source_i686=('kubectl-v1.18.15::https://storage.googleapis.com/kubernetes-release/release/v1.18.15/bin/linux/386/kubectl')
sha256sums_i686=('f124733286c67d368bd0413b736aa14b15c00533ccdc2278d6fdef3fb8cb5ac5')
source_x86_64=('kubectl-v1.18.15::https://storage.googleapis.com/kubernetes-release/release/v1.18.15/bin/linux/amd64/kubectl')
sha256sums_x86_64=('eb5a5dd0a72795942ab81d1e4331625e80a90002c8bb39b2cb15aa707a3812c6')
source_armv5=('kubectl-v1.18.15::https://storage.googleapis.com/kubernetes-release/release/v1.18.15/bin/linux/arm/kubectl')
sha256sums_armv5=('952530dd6b272eed932e49a29625e20303b9621ba36c1cc0394476d483f6860a')
source_armv6h=('kubectl-v1.18.15::https://storage.googleapis.com/kubernetes-release/release/v1.18.15/bin/linux/arm/kubectl')
sha256sums_armv6h=('952530dd6b272eed932e49a29625e20303b9621ba36c1cc0394476d483f6860a')
source_armv7h=('kubectl-v1.18.15::https://storage.googleapis.com/kubernetes-release/release/v1.18.15/bin/linux/arm/kubectl')
sha256sums_armv7h=('952530dd6b272eed932e49a29625e20303b9621ba36c1cc0394476d483f6860a')
source_aarch64=('kubectl-v1.18.15::https://storage.googleapis.com/kubernetes-release/release/v1.18.15/bin/linux/arm64/kubectl')
sha256sums_aarch64=('6b4a63df325cdb523f16ffd8799745a8fdf979ef89e228c309a715671b6aa984')
