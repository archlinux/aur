# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.32.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.32.0/pack-v0.32.0-linux.tgz")
sha512sums=("d51f934845c760b64030bc5f1ce5597a5d8a7d19a2c82c13a5b74b5e5963b6be7bea5aba8f5230a07fd8653f1e58032e204c128f204d1a35600d2df8f532ac14")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}