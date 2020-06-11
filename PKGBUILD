# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.11.2
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.11.2/pack-v0.11.2-linux.tgz")
sha512sums=("d47100b29d96a30f932ab60b1cea9999f2ccf662cf5e9de6845419452f7f700b2fa3971e0e47e6f6e233f6e124f5e82a588a021139d3cbdd61cdc2545f9c7019")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}