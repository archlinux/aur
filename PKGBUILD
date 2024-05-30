# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.34.1
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.34.1/pack-v0.34.1-linux.tgz")
sha512sums=("e9fdb7ee8ceaa06e804f4e597a34dbe2d51c140f64b8616f9ee48eefdb865f217e83dd4ee801e2a270f9abca211792cdd5462a6217ae3aaffb563158a84276c0")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}