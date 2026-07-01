# Maintainer: Jaël Champagne Gareau <gareau_jael@hotmail.com>
# Contributor:
pkgname=clustertool-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Tool to help bootstrap a Kubernetes cluster"
arch=('x86_64')
url="https://truecharts.org"
license=('AGPL-3.0-only')
options=("!debug")
source=("https://github.com/trueforge-org/clustertool/releases/download/v${pkgver}/clustertool_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('c4e984a7c38d2188501be9e430298ce2a6a62fac06694232f16d3c5ca4d5bd88')

package() {
  # Extract the main package, excluding debug files and metadata
  bsdtar --exclude=.MTREE --exclude=.PKGINFO -xf "${srcdir}/clustertool_${pkgver}_linux_amd64.pkg.tar.zst" -C "$pkgdir"
}
