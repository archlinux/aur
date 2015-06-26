# Maintainer: Albert Berger < nbdspcl at gmail dot com>
pkgname=pacliner
pkgver=0.1.2
pkgrel=1
pkgdesc="Archlinux package management helper."
arch=('any')
url="https://github.com/nbdsp/pacliner"
license=('GPL')
groups=()
depends=('bash' 'perl')
optdepends=('pacgraph: package information'
	    'expack: package information')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::https://github.com/nbdsp/pacliner/archive/v0.1.2.tar.gz")
noextract=()
md5sums=('SKIP')


package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}
