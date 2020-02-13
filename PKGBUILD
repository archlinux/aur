# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=pack-cli-bin
pkgver=0.8.1
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
sha512sums=('00466e9b1277b96fd5804afd692312ab2a503218d71b4b52d5f4dd00406633bf3da1786e76305751c9b0c942d1b10a9ffc2dd974a2e18e9269ea7959750e61cc')
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}
