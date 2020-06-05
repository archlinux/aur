# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.11.0/pack-v0.11.0-linux.tgz")
sha512sums=("c5cea886d5e0ae5268cb26fee195fdde27d5ffda2381d5c226b6a8e4e7c0177ed77a2dd674cf1469c90c7f8f7ec95d34c912e2116c298bb2bcfc167a192be837")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}