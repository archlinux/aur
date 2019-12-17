# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kubectl-gke-stable-bin
pkgver=v1.13.12
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the stable channel'
provides=("kubectl=v1.13.12")
conflicts=(kubectl kubectl-bin)
arch=(i686 x86_64 armv5 armv6h armv7h aarch64 )
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "$srcdir/kubectl" "$pkgdir/usr/bin/kubectl"
}

source_i686=('https://storage.googleapis.com/kubernetes-release/release/v1.13.12/bin/linux/386/kubectl')
sha256sums_i686=('4119ed902fc89463a46753596d9509fa510536f7b73d2bf97b96f26178eb9628')
source_x86_64=('https://storage.googleapis.com/kubernetes-release/release/v1.13.12/bin/linux/amd64/kubectl')
sha256sums_x86_64=('3578dbaec9fd043cf2779fbc54afb4297f3e8b50df7493191313bccbb8046300')
source_armv5=('https://storage.googleapis.com/kubernetes-release/release/v1.13.12/bin/linux/arm/kubectl')
sha256sums_armv5=('22d654d52f2ef17176fa43ea3998cfcb3281caad1a9685083cc6dcab40e4fabc')
source_armv6h=('https://storage.googleapis.com/kubernetes-release/release/v1.13.12/bin/linux/arm/kubectl')
sha256sums_armv6h=('22d654d52f2ef17176fa43ea3998cfcb3281caad1a9685083cc6dcab40e4fabc')
source_armv7h=('https://storage.googleapis.com/kubernetes-release/release/v1.13.12/bin/linux/arm/kubectl')
sha256sums_armv7h=('22d654d52f2ef17176fa43ea3998cfcb3281caad1a9685083cc6dcab40e4fabc')
source_aarch64=('https://storage.googleapis.com/kubernetes-release/release/v1.13.12/bin/linux/arm64/kubectl')
sha256sums_aarch64=('47ffe9064318c6a9613f6ac5a5f96ffb43dec6dc4a37ea4b2992bf378c8e6f02')
