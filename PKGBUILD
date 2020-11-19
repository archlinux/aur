# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.15.1/pack-v0.15.1-linux.tgz")
sha512sums=("8bd31a4fb2382c662737de97ca6d6ebcfc4fe5c5acf907a91bc90c6a03fbd9418027b59c34c91c4fcbe531f670aefb743a1da62e511a1a19387615b1bb4740a4")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}