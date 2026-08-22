# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwalld-bin
pkgver=5.5.1
pkgrel=1
pkgdesc="LianWall Daemon - wallpaper engine based on awww/swww and mpvpaper"
arch=('x86_64')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=('awww' 'mpvpaper')
optdepends=(
    'nvidia-utils: NVIDIA GPU VRAM monitoring'
    'rocm-smi-lib: AMD GPU VRAM monitoring'
)
provides=('lianwalld')
conflicts=('lianwalld')
source=("https://github.com/Yueosa/lianwall/releases/download/v${pkgver}/lianwalld_${pkgver}_linux_x86_64")
sha256sums=('3767596d2bc608ab0caca20584bf3a80b4d6dbae209693e0784f31451f307bd2')

package() {
    install -Dm755 "lianwalld_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwalld"
}
