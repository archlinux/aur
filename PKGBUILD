# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.17.0/pack-v0.17.0-linux.tgz")
sha512sums=("3b4cfabfdeb952a2e8c54fb034306c8a94bf63e7c5a8a3b6fe8ec61a20d8004f07abd01e45ea9e065739293d4c9e42f0fad2e967f593150dcc51a4dfe9d40c80")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}