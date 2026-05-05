# Maintainer: Joao Paulo Santos <lw.joao.paulo.santos@gmail.com>
pkgname=hypr-bg-manager
pkgver=1.0.4
pkgrel=1
pkgdesc="Dynamic wallpaper manager for Hyprland with multiple service backends and trigger modes"
arch=('any')
url="https://github.com/joao-paulo-santos/hypr-bg-manager"
license=('MIT')
depends=('hyprland' 'socat')
optdepends=(
    'swww: Fast wallpaper service with GIF support'
    'awww: Wallpaper service (swww successor)'
    'hyprpaper: Native Hyprland wallpaper service'
    'swaybg: Lightweight wallpaper service'
    'mpvpaper: Video wallpaper service'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('af1681af4df88493de50741632e5617927e164fcb9c3f4fe1a67367b2c7a590b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}