# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>

_pkgname='krew'
pkgname="${_pkgname}-bin"
pkgver=0.3.4
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

source=("https://github.com/kubernetes-sigs/krew/releases/download/v${pkgver}/krew.tar.gz")
sha256sums=('6629b1d7ad215322361f8dd270396fd1a23555fdbde8dcc1ba4ad860978b319a')

package() {
	cd "${srcdir}"
  install -Dm755 "krew-linux_amd64" "${pkgdir}/usr/bin/kubectl-krew"
}
