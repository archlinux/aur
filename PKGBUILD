# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)')
source_x86_64=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_musl")
source_armv7h=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
noextract=("${_pkgname}")
sha256sums_x86_64=('7c2525118ed6db4a11ef49658359ad5cd89d70b6d2f3c2d14a9e45b54c959721')
sha256sums_armv7h=('7bdf66ac60baa1dd986b9b2edadef0f2b6434d9d0de111c357292766453be0c3')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
