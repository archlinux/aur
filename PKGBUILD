# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.34.2
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.34.2/pack-v0.34.2-linux.tgz")
sha512sums=("4c812d9dd15aa0a6d9981cacf84f611f12c573c1e7fccbc9e2173c3a48e0e14649387a7821b1307641cc37bc9cc3df222b737cf0db766468fc0ec1a5a9e995af")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}