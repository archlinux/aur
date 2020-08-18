# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.13.0/pack-v0.13.0-linux.tgz")
sha512sums=("4bd3f14c714cc404a02206864c82da3124568980965c14b46f215201586e85395b135b26ca7105742b6a23a4eb3cb45b1913510118de76857d5bee259965dbc7")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}