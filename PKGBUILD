# Maintainer: Ruben Kharel <aur@rubenk.dev>

pkgname=swaylock-corrupter
_pkgname=corrupter
pkgver=1.2
_pkgver=1.0
pkgrel=1
pkgdesc='Swaylock integrated with Simple image glitcher'

arch=('x86_64')
url="https://github.com/r00tman/${_pkgname}"
depends=("grim" "swaylock")

provides=("${_pkgname}" "${pkgname}")
conflicts=("${_pkgname}" "${pkgname}")

license=('BSD 2-Clause')
sha256sums=('d7d2d8e2c15986ec2ffe9bfaa1b8c7bd110a0020847cdc917206c4b7f887e973' '7dc74623de526a0f4b8587ce9ddbc3b667ccb3d51b7a8b38f2768c1670ff0b94')
source=("${url}/releases/download/v${_pkgver}/${_pkgname}_v${_pkgver}_x86_64.tar.gz" "${pkgname}")

package() {
    cd "${_pkgname2%-git}"
		install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
		install -D -t "$pkgdir/usr/bin" "$srcdir/swaylock-corrupter"
}
