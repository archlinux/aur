pkgname=hyprwat-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Hyprwat - A Wayland menu tool"
arch=('x86_64')
url="https://github.com/zackb/hyprwat"
license=('MIT')
depends=('wayland' 'mesa' 'fontconfig' 'libxkbcommon' 'sdbus-cpp' 'pipewire' 'libdrm')
provides=('hyprwat')
conflicts=('hyprwat')
source=("https://github.com/zackb/hyprwat/releases/download/$pkgver/hyprwat-$pkgver.tar.gz")
sha256sums=('d38451bb6084dec0dceee81d280f2969d8f9ea7f3037c892cd31147cafea1d3f')

package() {
    cd "hyprwat-$pkgver"
    install -Dm755 bin/hyprwat "$pkgdir/usr/bin/hyprwat"
    install -Dm644 share/man/man6/hyprwat.6 "$pkgdir/usr/share/man/man6/hyprwat.6"
}
