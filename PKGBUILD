# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>

_pkgname='krew'
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=2
pkgdesc='Krew is the package manager for kubectl plugins.'
arch=('x86_64')
url='https://krew.sigs.k8s.io/'
license=('Apache')
depends=()
optdepends=()
makedepends=()
conflicts=("${_pkgname}")
provides=('krew' 'krew-bin')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/kubernetes-sigs/krew/releases/download/v${pkgver}/krew.tar.gz")
sha256sums=('039fbb18c784f6b097b7ee6d048d36dfdb055c6e3a7c76e7251536594d6027a2')

package() {
	cd "${srcdir}"
  install -Dm755 "krew-linux_amd64" "${pkgdir}/usr/bin/kubectl-krew"
}
