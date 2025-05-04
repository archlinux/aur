pkgname=openvpn-hidemyname
pkgver=2.6.12
pkgrel=1
pkgdesc="OpenVPN with HideMyName patches for obfuscation"
arch=('x86_64')
url=https://hidemy.name/ru/vpn/router/openwrt/
license=('custom')
depends=('openvpn')
options=(!debug)
# Use the mirror url of HideMyName site
source=("patched-openvpn::https://hixxxx.name/files/software/obf/openvpn-2.6.12-archlinux-2024.09.01-x86_64")
sha256sums=('57de508943a5ca7e532cb188866e7c472483fc6d233c0397c76b1253e7b5458b')

package() {
    install -D -m755 "${srcdir}/patched-openvpn" "${pkgdir}/usr/bin/openvpn-hmn"
}
