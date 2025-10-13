# Maintainer: Joao Paulo Santos <lw.joao.paulo.santos@gmail.com>
pkgname=hypr-bg-manager
pkgver=1.0.3
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
sha256sums=('4aecdcedef523347af90adb3e7926f52b2fd7c88d58fc782d53ff2f2d6bcc762')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}