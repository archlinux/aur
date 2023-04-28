# Maintainer: Omeed Safi <aur@safi.ms>
_pkgname=akr
pkgname="${_pkgname}-bin"
pkgver=1.1.2
pkgrel=1
pkgdesc="Akamai Krypton CLI and SSH Agent"
arch=("x86_64")
url="https://github.com/akamai/akr"
license=("custom:Akamai")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/akamai/akr-pkg/raw/008a95249fbff7ff9fde9384fe1b21963fa84f75/ubuntu/akr_1.1.2_amd64.deb")
sha256sums=("51aecff5fddc1aaff9dc8e519a7516bc258a855a6cde52faf6555ec6bc3a10dc")

package() {
    tar xf data.tar.xz -C "${srcdir}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${srcdir}/usr/bin/${_pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" "${srcdir}/usr/share/doc/${_pkgname}/copyright"
}
