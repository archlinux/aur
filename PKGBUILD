# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
provides=('pack-cli')
conflicts=('pack-cli')
source=("https://github.com/buildpacks/pack/releases/download/v0.11.1/pack-v0.11.1-linux.tgz")
sha512sums=("1569d480f26db8435e437ab3c1c42aa1e78fb05527db739fb55355001593af372e63dbf9c432803301c452e56f576256984d7316bdcd194ec6238c92c06ecf84")
package() {
	install -D -m755 "${srcdir}/pack" "${pkgdir}/usr/bin/pack"
}