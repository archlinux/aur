# Maintainer: Alexis "Horgix" Chotard <aur-kargo-cli@foss.horgix.fr>

_pkgbasename=kargo-cli
_pkgkind=bin

pkgname="${_pkgbasename}-${_pkgkind}"
pkgver=1.4.3
pkgrel=1
conflicts=("${_pkgbasename}-git")
pkgdesc="Kargo (https://kargo.io/) CLI for multi-stage GitOps Promotion (ArgoCD/Kubernetes)"
arch=('x86_64')
url="https://github.com/akuity/kargo"
license=('Apache-2.0')

source=(${pkgname}-${pkgver}::"https://releases.crossplane.io/stable/v${pkgver}/bin/linux_amd64/crossplane")
source=(${pkgname}-${pkgver}::"https://github.com/akuity/kargo/releases/download/v${pkgver}/kargo-linux-amd64")
sha256sums=('480920958ce02a5f4bf6a1ea161329caacbe5b29b34216b5d10b5f783fb7cf58')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/kargo"
}

