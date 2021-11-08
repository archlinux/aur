# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.22.0/pack-v0.22.0-linux.tgz")
sha512sums=("d06b1ebccf988a75f2a2f55f1411d1787d6669766fa95502a9ef62bd3263bfb6ffc9a78f989bb347509d69c78ee0db842755e01810a3558d3b8dc7dbb3f9765f")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}