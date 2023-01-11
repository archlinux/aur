# Maintainer: Ruben Kharel <kharelruben@gmail.com>

pkgname=swaylock-corrupter
_pkgname=corrupter
pkgver=1.1
_pkgver=1.0
pkgrel=1
pkgdesc='Swaylock integrated with Simple image glitcher'

arch=('x86_64')
url="https://github.com/r00tman/${_pkgname}"
depends=("grim" "swaylock")

provides=("${_pkgname}" "${pkgname}")
conflicts=("${_pkgname}" "${pkgname}")

license=('BSD 2-Clause')
md5sums=('04f1c9c324d12717b10c5173a5363f25' 'e19c13dba92d2846b671f378146d15f1')
source=("${url}/releases/download/v${_pkgver}/${_pkgname}_v${_pkgver}_x86_64.tar.gz" "${pkgname}")

package() {
    cd "${_pkgname2%-git}"
		install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
		install -D -t "$pkgdir/usr/bin" "$srcdir/swaylock-corrupter"
}
