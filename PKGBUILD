# Maintainer: Kisuke <kisuke at tauren dot cz>
pkgname=openvpn-gui-linux-bin
_pkgname=openvpn-gui-linux
pkgver=0.1.3
pkgrel=1
pkgdesc='A simple Linux GUI for OpenVPN'
arch=('x86_64')
url='https://github.com/DenysFizer/openvpn-gui-linux'
license=('MIT')
provides=('openvpn-gui-linux')
depends=('openvpn')
source=("https://github.com/DenysFizer/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('a174b9b368f7899f901d12adad5db3f26d96faa8cf8750f42ec210c2a82600c7')

package() {
    
    bsdtar -xf data.tar.xz -C "$pkgdir/"

}
