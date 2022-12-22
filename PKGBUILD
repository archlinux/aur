# Maintainer: Omeed Safi <aur@safi.ms>
_pkgname=akr
pkgname="${_pkgname}-bin"
pkgver=1.1.1
pkgrel=1
pkgdesc="Akamai Krypton CLI and SSH Agent"
arch=("x86_64")
url="https://github.com/akamai/akr"
license=("custom:Akamai")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/akamai/akr-pkg/raw/05e660f09d3445daa59f6fcafc10ebb55edb471d/ubuntu/akr_1.1.1_amd64.deb")
sha256sums=("4f787a744feeba3bee1c3d9991a375ce8fe86bf0abe7805f5abf84864e79a5c8")

package() {
    tar xf data.tar.xz -C "${srcdir}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${srcdir}/usr/bin/${_pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" "${srcdir}/usr/share/doc/${_pkgname}/copyright"
}
