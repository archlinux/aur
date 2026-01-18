# Maintainer: Yang Mingtian <i@skylee.xyz>
pkgname=vampire-bin
pkgver=5.0.1
pkgrel=1
pkgdesc='A theorem prover for first-order logic'
arch=('x86_64')
url='https://vprover.github.io/'
license=('custom:Vampire Software Licence Agreement')
source=("${pkgname}-${pkgver}.zip::https://github.com/vprover/vampire/releases/download/v${pkgver}/vampire-Linux-X64.zip")
sha256sums=('79f2864d2dd45d0afc7068594123ca389378bfbd188ebcead446ba299d3bd3c5')

package() {
	install -D "vampire" -t "${pkgdir}/usr/bin/"
}
