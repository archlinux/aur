# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.18.0/pack-v0.18.0-linux.tgz")
sha512sums=("39dd851fb0288d420fddf9a67d913d9145ea7530a190ef9822c5093be82db26c9387637212333cad11f830daf2852f646d1dc21671279ef9c87306158900afe0")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}