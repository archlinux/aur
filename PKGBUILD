# Maintainer: Joao Paulo Santos <lw.joao.paulo.santos@gmail.com>
pkgname=hypr-bg-manager
pkgver=1.0.2
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
sha256sums=('39d387b8066fcd0fd1b0e64a08d2e14a0cf11b41a8c63ea78c1a9d60bb275346')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}