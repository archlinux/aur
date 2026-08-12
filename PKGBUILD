# Maintainer: MCB-SMART-BOY <mcb2720838051@gmail.com>
# AUR Package: gridix-bin

pkgname=gridix-bin
pkgver=7.2.0
pkgrel=1
pkgdesc="Fast, secure, cross-platform database management tool with Helix/Vim keybindings (precompiled)"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('Apache-2.0')
depends=('gtk3' 'xdotool')
provides=('gridix')
conflicts=('gridix' 'gridix-appimage')
source=("gridix-linux-x86_64-$pkgver.tar.gz::https://github.com/MCB-SMART-BOY/Gridix/releases/download/v$pkgver/gridix-linux-x86_64.tar.gz"
        "gridix-$pkgver.desktop::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v$pkgver/gridix.desktop"
        "gridix-icon-$pkgver.png::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v$pkgver/assets/branding/gridix-icon.png"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v$pkgver/LICENSE")
sha256sums=('accbe6ff469f47e4699061eca402b78ed981fae8d1c31dd07500791cae722df6'
            '3a87bbb77f4a98ff45f21d3648fc5fe761352fdef4d2e82233bb96095a7b83cf'
            '5fb40df52c427b365f594d56110e21346288936f2bc2aa2b461783a1be8c35ea'
            '01132d0ac431cc5a8f34ea8ba055deb6f68d7034d8ed6f821b827f4b9195aae4')

package() {
    install -Dm755 "gridix" "$pkgdir/usr/bin/gridix"
    install -Dm644 "gridix-$pkgver.desktop" "$pkgdir/usr/share/applications/gridix.desktop"
    install -Dm644 "gridix-icon-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gridix.png"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
