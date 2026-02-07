# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwalld-bin
pkgver=5.1.3
pkgrel=1
pkgdesc="LianWall Daemon - wallpaper engine based on swww and mpvpaper"
arch=('x86_64')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=('swww' 'mpvpaper')
optdepends=(
    'nvidia-utils: NVIDIA GPU VRAM monitoring'
    'rocm-smi-lib: AMD GPU VRAM monitoring'
)
provides=('lianwalld')
conflicts=('lianwalld')
source=("https://github.com/Yueosa/lianwall/releases/download/v${pkgver}/lianwalld_${pkgver}_linux_x86_64")
sha256sums=('cd2eaa1f29db6407f70532c1f3f411721bdbc5b5459eded68667410c997f98f9')

package() {
    install -Dm755 "lianwalld_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lianwalld"
}
