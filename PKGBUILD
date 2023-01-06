# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.10.4
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
source_armv7h=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_aarch64")
noextract=("${_pkgname}")
sha256sums_x86_64=('d70a7561a43f8d381f83f41f71985f954b17bd0552732f6804949a5deae6967a')
sha256sums_armv7h=('008af2f210f9cf5a7ecbea100f9fdec869c97d269b542b3d279fef510deacdb1')
sha256sums_aarch64=('256d1f7a10655c2bc67dbe0b7e48e8ae718ea0fd052871173996f54d99cfb28f')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
}
