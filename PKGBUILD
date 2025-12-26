# Program Maintainer: Aashish Thapa <https://github.com/aashish-thapa>
# AUR Maintainer: justanoobcoder <syaorancode@gmail.com>

pkgname=wlctl-bin
_pkgname=wlctl
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI for managing WiFi using NetworkManager (a fork of impala)"
arch=("x86_64")
url="https://github.com/aashish-thapa/wlctl"
license=("GPL-3.0")
depends=("networkmanager")
conflicts=("$_pkgname-git")
source=("$_pkgname::$url/releases/download/v$pkgver/$_pkgname-$arch-unknown-linux-musl")
sha256sums=("4b66ceee40f4e82477201f7b373a4aa36cc29b2fa5a221f34de4505ebf7a5ec3")

package() {
  install -Dm 755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
}
