# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>

_pkgname='krew'
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
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
sha256sums=('a26deea175f70264260d59a4e061778a892f8a8e301ac261660dd7d24c551c99')

package() {
	cd "${srcdir}"
  install -Dm755 "krew-linux_amd64" "${pkgdir}/usr/bin/kubectl-krew"
}
