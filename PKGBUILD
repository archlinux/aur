pkgname=hyprwat-bin
pkgver=0.11.5
pkgrel=1
pkgdesc="Hyprwat - A Wayland menu tool"
arch=('x86_64')
url="https://github.com/zackb/hyprwat"
license=('MIT')
depends=('wayland' 'mesa' 'fontconfig' 'libxkbcommon' 'sdbus-cpp' 'pipewire' 'libdrm')
provides=('hyprwat')
conflicts=('hyprwat' 'hyprwat-git')
source=("https://github.com/zackb/hyprwat/releases/download/$pkgver/hyprwat-$pkgver.tar.gz")
sha256sums=('9acf879dcb10e7f243410da2bd1bb006b3538294e8b501b7a0b6a3819fba6277')

package() {
    cd "hyprwat-$pkgver"
    install -Dm755 bin/hyprwat "$pkgdir/usr/bin/hyprwat"
    install -Dm644 share/man/man6/hyprwat.6 "$pkgdir/usr/share/man/man6/hyprwat.6"
}
