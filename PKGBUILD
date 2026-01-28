# Maintainer: Pater Kleomenis <paterkleomenis@protonmail.com>
pkgname=connected-desktop-bin
_pkgname=connected-desktop
pkgver=1.0.9
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
sha256sums=('5d7e302d87d774481ebcb4435e234c4c32ac0b0e089ad905831ce8756d6b7e8c'
            'baf3b2e0d55d9fcb23630a7a6c0eff68eb9b708f8f0ce8e698dcf8ea611666ad'
            '9e0b561ca05d47281fe703e6d85cb2086781b3815b267c50e4f82b2186f59a90'
            'fdc5b45803bf8f5d4435509da25399414072b3d95badd6b09b2e84c2f1f198d5'
            '6bbe4ace8a1818f89b96dfdda9f9d4b9a178bc047c3dc2511a3d93d51f86d7ae')

package() {
  install -Dm755 "connected-desktop" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "connected-desktop.desktop" "$pkgdir/usr/share/applications/connected-desktop.desktop"
  install -Dm644 "ic_launcher-playstore.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/connected-desktop.png"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"
}
