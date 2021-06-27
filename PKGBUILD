# Maintainer: Rsplwe <i@rsplwe.com>
pkgname=prpr
pkgver=kira_1
pkgrel=1
epoch=
pkgdesc="pe~ ro~ pe~ ro~"
arch=('any')
url="https://github.com/Rsplwe/prpr"
license=('WTFPL')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/Rsplwe/prpr.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "${pkgname}"
	rm -rf "${pkgname}"
	gcc -O3 main.c -o "${pkgname}"
}

package() {
	cd "${pkgname}"
	install -D -m 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m 644 'LICENCE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
