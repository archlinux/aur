# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.18.1
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.18.1/pack-v0.18.1-linux.tgz")
sha512sums=("fee06c4f2a6093e32ff417490e7f064ef892e5dfa1591b2c2bbb40133b6991374d77c8a45cf80ccaf30dba74735cf694291556ca5fc6720affcc1bb832df7b10")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}