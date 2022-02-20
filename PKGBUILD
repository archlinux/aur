# Maintainer: Omeed Safi <aur@safi.ms>
_pkgname=akr
pkgname="${_pkgname}-bin"
pkgver=1.0
pkgrel=1
pkgdesc="Akamai Krypton CLI and SSH Agent"
arch=("x86_64")
url="https://github.com/akamai/akr"
license=("custom:Akamai")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://akamai.github.io/akr-pkg/debian/akr_0.1.0_amd64.deb")
sha256sums=("2177f18581781088c16e0d1ad18fbec8703b9662961bdeeb29f705d58d12e211")

package() {
    tar xf data.tar.xz -C "${srcdir}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${srcdir}/usr/bin/${_pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" "${srcdir}/usr/share/doc/${_pkgname}/copyright"
}
