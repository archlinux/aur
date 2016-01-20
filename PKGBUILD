# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=fakepkg
pkgver=1.30.0
pkgrel=1
pkgdesc="A tool to reassemble installed packages from its deliverd files. It comes in handy if there is no internet connection available and you have no access to an up-to-date package cache."
arch=('any')
license=('GPL2')
url="https://github.com/Edenhofer/fakepkg"
depends=('bash>=4.2' 'pacman' 'tar' 'xz' 'gzip' 'parallel')
source=("${pkgname}-${pkgver}.zip"::"https://github.com/Edenhofer/fakepkg/archive/v${pkgver}.zip")
md5sums=('0e9ae895eaf22a60db260f4d40c5886f')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 "${pkgname}"       "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
