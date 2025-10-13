pkgname=hyprwat-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Hyprwat - A Wayland menu tool"
arch=('x86_64')
url="https://github.com/zackb/hyprwat"
license=('MIT')
depends=('wayland' 'mesa' 'fontconfig' 'libxkbcommon' 'sdbus-cpp' 'pipewire')
provides=('hyprwat')
conflicts=('hyprwat')
source=("https://github.com/zackb/hyprwat/releases/download/$pkgver/hyprwat-$pkgver.tar.gz")
sha256sums=('b2c523c4f6aece37b67cd3de211b923f6d78191b640435641266a421862b7d18')

package() {
    cd "hyprwat-$pkgver"
    install -Dm755 bin/hyprwat "$pkgdir/usr/bin/hyprwat"
    install -Dm644 share/man/man6/hyprwat.6 "$pkgdir/usr/share/man/man6/hyprwat.6"
}
