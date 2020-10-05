# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.14.1/pack-v0.14.1-linux.tgz")
sha512sums=("11505e9832a4ab399adada15f9f534fc7f13a763b000d3418b4ffb926b48e9dc61864cd58b3e8a00a78cec4c85910fcfde0e1e4e7e7171a8c0d2fc422044f048")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}