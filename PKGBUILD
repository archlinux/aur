# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
pkgname=networkmanager-openvpn-xdg-bin
pkgver=1.10.2
pkgrel=2
pkgdesc="NetworkManager VPN plugin for OpenVPN - with Support for the XDG Base Directory Specification (binary version)"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
depends=(
  libnm
  libsecret
  openvpn
)
optdepends=(
  'libnma-gtk4: GUI support (GTK 4)'
  'libnma: GUI support (GTK 3)'
)
source=("https://github.com/noahvogt/${pkgname%-*}-aur/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-$arch.pkg.tar.zst")
sha256sums=('5c80f278a76b6d2d19f7e75da44211811b95b20c40c50f4fb9b1569782ab0487')
provides=('networkmanager-openvpn')
conflicts=('networkmanager-openvpn')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
