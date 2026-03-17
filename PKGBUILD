# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=promrail
pkgname="${_pkgname}-bin"
pkgver=0.0.0
pkgrel=1
pkgdesc="Git-native GitOps promotion tool"
arch=('x86_64' 'aarch64')
url="https://github.com/forkline/promrail"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/forkline/promrail/releases/download/v${pkgver}/promrail-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('4db586c55d24a4e2106112fd97814838b4022312423c4d37745a7b7a78bf9c95')

package() {
	install -Dm755 promrail "${pkgdir}/usr/bin/promrail"
}
