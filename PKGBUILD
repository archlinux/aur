pkgname=nordvpn-bin
pkgver=1.1.6
pkgrel=3
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('openvpn')
options=('!strip')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver}_amd64.deb")
sha256sums=('e85d9739fdb8236682a844fa5bfbc8c02b5020f779a44e27ab0bc3d500959323')

package() {
    bsdtar -O -xf "nordvpn_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
