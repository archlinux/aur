# Maintainer: Ruben Kharel <aur@rubenk.dev>

pkgname=swaylock-corrupter
_pkgname=corrupter
pkgver=1.2
_pkgver=1.0
pkgrel=2
pkgdesc='Swaylock integrated with Simple image glitcher'

arch=('x86_64')
url="https://github.com/r00tman/${_pkgname}"
depends=("grim" "swaylock")

provides=("${_pkgname}" "${pkgname}")
conflicts=("${_pkgname}" "${pkgname}")

license=('BSD 2-Clause')
sha256sums=('d7d2d8e2c15986ec2ffe9bfaa1b8c7bd110a0020847cdc917206c4b7f887e973' '40dbe2b0d7982908d51d0aa3f3de2d86738b566e81cd8c73720ecc22516504d4')
source=("${url}/releases/download/v${_pkgver}/${_pkgname}_v${_pkgver}_x86_64.tar.gz" "${pkgname}")

package() {
    cd "${_pkgname2%-git}"
		install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
		install -D -t "$pkgdir/usr/bin" "$srcdir/swaylock-corrupter"
}
