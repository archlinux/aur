#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=cowsay-cthulhu
pkgver=1.0.0
arch=("x86_64")
pkgrel=1
pkgdesc="Cthulhu for cowsay"
license=("MIT")
depends=("cowsay")
url="https://gist.github.com/LevitatingBusinessMan/9e08c0751a4879ebc652378136882efe"
source=("cthulhu.cow")
sha256sums=("a4a439e2b4d30450d1b11fbda77fbad377ed5792f7ca805416631544974b5dd4")


package() {
	cd "${srcdir}"
	install -Dm 644 cthulhu.cow "${pkgdir}/usr/share/cows/cthulhu.cow"
}
