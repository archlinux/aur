# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.33.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.33.0/pack-v0.33.0-linux.tgz")
sha512sums=("4f2ca103eaf22ead97d5605a5e2db536ababaafa668a461fac59fcb2144b3e314d0fb2c0a1380d29df607bf5dcc3374918aa741fd9fb6292b30ccd65463a0ae4")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}