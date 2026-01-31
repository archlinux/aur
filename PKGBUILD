# Maintainer: Pater Kleomenis <paterkleomenis@protonmail.com>
pkgname=connected-desktop-bin
_pkgname=connected-desktop
pkgver=2.1.8
pkgrel=1
pkgdesc="High-speed, offline, cross-platform ecosystem bridging devices (Binary)"
arch=('x86_64')
url="https://github.com/paterkleomenis/connected"
license=('MIT' 'Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'openssl' 'dbus')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("https://github.com/paterkleomenis/connected/releases/download/${pkgver}/connected-desktop"
        "https://raw.githubusercontent.com/paterkleomenis/connected/main/packaging/aur/connected-desktop.desktop"
        "https://raw.githubusercontent.com/paterkleomenis/connected/main/android/app/src/main/ic_launcher-playstore.png"
        "https://raw.githubusercontent.com/paterkleomenis/connected/main/LICENSE-MIT"
        "https://raw.githubusercontent.com/paterkleomenis/connected/main/LICENSE-APACHE")


package() {
  install -Dm755 "connected-desktop" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "connected-desktop.desktop" "$pkgdir/usr/share/applications/connected-desktop.desktop"
  install -Dm644 "ic_launcher-playstore.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/connected-desktop.png"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"
}
