pkgname=hyprwat-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="Hyprwat - A Wayland menu tool"
arch=('x86_64')
url="https://github.com/zackb/hyprwat"
license=('MIT')
depends=('wayland' 'mesa' 'fontconfig' 'libxkbcommon' 'sdbus-cpp' 'pipewire' 'libdrm')
provides=('hyprwat')
conflicts=('hyprwat')
source=("https://github.com/zackb/hyprwat/releases/download/$pkgver/hyprwat-$pkgver.tar.gz")
sha256sums=('8ca4a2484232c7d8e4904cd470fa2426e5bcd9b3445ee328815de420d2ca112d')

package() {
    cd "hyprwat-$pkgver"
    install -Dm755 bin/hyprwat "$pkgdir/usr/bin/hyprwat"
    install -Dm644 share/man/man6/hyprwat.6 "$pkgdir/usr/share/man/man6/hyprwat.6"
}
