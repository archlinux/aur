# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.14.2/pack-v0.14.2-linux.tgz")
sha512sums=("760309e6ae61726092429ad787861ab697f4329c8aa253a0293c3a64274fc4afc8b1ca2cc52537fd8f5c29da7ad92aa7651ce76edbda33723cc663d2e052d84c")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}