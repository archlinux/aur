# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=pack-cli-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
depends=('docker')
provides=('pack-cli')
conflicts=('pack-cli')
source=(
	"pack-${pkgver}.tgz::https://github.com/buildpacks/pack/releases/download/v${pkgver}/pack-v${pkgver}-linux.tgz"
)
sha512sums=('972fc56148502838a052df940246afa734713c36c39e310a0a37eedaf1b624ecc0273ad757c940a0e73256fba3957a23a3233dc3b252b50741be9f930d68ff91')
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}
