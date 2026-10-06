# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwalld-bin
pkgver=5.5.2
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
sha256sums=('3802486be82e4ca403985f847b55ab83f74f4f8a20f9fc4a2e8bfca4ecfe03c0')

package() {
    install -Dm755 "lianwalld_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwalld"
}
