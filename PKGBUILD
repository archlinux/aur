# See contacts at https://aur.archlinux.org/cgit/aur.git/tree/README.md?h=lazyovpn-bin

pkgname=lazyovpn-bin
_pkgname=lazyovpn
pkgver=0.8.1
pkgrel=1
pkgdesc="A terminal UI for managing OpenVPN connections"
arch=("x86_64")
url="https://github.com/omartelo/lazyovpn"
license=("MIT")
depends=('openvpn' 'polkit' 'zenity')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/omartelo/${_pkgname}/releases/download/v${pkgver}/lazyovpn_${pkgver}_linux_amd64.tar.gz")
sha256sums=('350d73ca024dcf97c9159cc28d7c0ae78840e35a0d89099aa3e9bc6233c7914a')

package() {
  mkdir -vp "${pkgdir}/usr/bin"
  cp -vr --no-preserve=ownership --preserve=mode "lazyovpn" "${pkgdir}/usr/bin"
}
