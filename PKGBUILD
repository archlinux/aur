# Maintainer: Albert Berger < nbdspcl at gmail dot com>
pkgname=pacliner
pkgver=0.1
pkgrel=1
pkgdesc="Archlinux package management helper."
arch=('any')
url="https://github.com/nbdsp/pacliner.git"
license=('GPL')
groups=()
depends=('bash','perl')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+$url#tag=v0.1")
noextract=()
md5sums=('SKIP')


package() {
	cd "${pkgname}"
	install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
}
