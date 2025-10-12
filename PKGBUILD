# Maintainer: Joao Paulo Santos <lw.joao.paulo.santos@gmail.com>
pkgname=hypr-bg-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="Dynamic wallpaper manager for Hyprland with multiple service backends and trigger modes"
arch=('any')
url="https://github.com/joao-paulo-santos/hypr-bg-manager"
license=('MIT')
depends=('hyprland' 'socat')
optdepends=(
    'swww: Fast wallpaper service with GIF support'
    'hyprpaper: Native Hyprland wallpaper service'
    'swaybg: Lightweight wallpaper service'
    'mpvpaper: Video wallpaper service'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cb4ab89fbc7d556619eafd3c57674ce3b05779baf2ec6ad4ff09f302e37e264f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}