# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
pkgname=networkmanager-openvpn-xdg-bin
pkgver=1.10.2
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN - with Support for the XDG Base Directory Specification (binary version)"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnma intltool python git)
optdepends=('libnma: GUI support')
source=("https://github.com/noahvogt/${pkgname%-*}-aur/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-$arch.pkg.tar.zst")
sha256sums=('e04a47030fcba7faaaafac01e3f9f467559d086d68e36e4a4f0d938bbf9708c1')
provides=('networkmanager-openvpn')
conflicts=('networkmanager-openvpn')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
