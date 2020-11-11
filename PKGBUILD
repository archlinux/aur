# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.15.0/pack-v0.15.0-linux.tgz")
sha512sums=("a1cff3a9de353b2c0a6a2b03b7d0d923492a195143d1828be6f2a72646d9ccaae11aef002d5df93d0ec14d4fdb3c6dccf32a486616002c47c99a7190b0b38960")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}