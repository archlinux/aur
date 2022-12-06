# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.28.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.28.0/pack-v0.28.0-linux.tgz")
sha512sums=("c18f67c44e84b734dd5875a691c75bbb8f4ed83f0875257af88e7d7b6a0799d371e3c53d25aca82a5978e6dffe2223db5b2fa80826b48577a6a5ece6e2bf2161")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}