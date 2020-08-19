# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.13.1/pack-v0.13.1-linux.tgz")
sha512sums=("20cd869978c0a8d5645574df020bbd4dbd604a1e2886299644a652f0ec92f933833a0ba2212b1c446ae92a2f0410af76a1a4cc4ae39f378a4c035e8e44d14186")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}