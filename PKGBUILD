# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=promrail
pkgname="${_pkgname}-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="Git-native GitOps promotion tool"
arch=('x86_64')
url="https://github.com/forkline/prl"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/forkline/promrail/releases/download/v${pkgver}/prl-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('c7305e6142ef2bd87cd66d52a9b7ada3aaa81083b809be0ccc45eb6755a1cb0c')

package() {
	install -Dm755 prl "${pkgdir}/usr/bin/prl"
}
