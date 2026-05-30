pkgname=hyprwat-bin
pkgver=0.11.4
pkgrel=1
pkgdesc="Hyprwat - A Wayland menu tool"
arch=('x86_64')
url="https://github.com/zackb/hyprwat"
license=('MIT')
depends=('wayland' 'mesa' 'fontconfig' 'libxkbcommon' 'sdbus-cpp' 'pipewire' 'libdrm')
provides=('hyprwat')
conflicts=('hyprwat' 'hyprwat-git')
source=("https://github.com/zackb/hyprwat/releases/download/$pkgver/hyprwat-$pkgver.tar.gz")
sha256sums=('0118b32109a550b43d2272c4cf68a6a05eae22a5b2717c0c1f7a46d4cbc665f3')

package() {
    cd "hyprwat-$pkgver"
    install -Dm755 bin/hyprwat "$pkgdir/usr/bin/hyprwat"
    install -Dm644 share/man/man6/hyprwat.6 "$pkgdir/usr/share/man/man6/hyprwat.6"
}
