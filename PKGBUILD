# Maintainer: Ben Mitchell <bjosephmitchell@gmail.com>
pkgname=swayfx-nvidia
pkgver=1.0.8
pkgrel=1
pkgdesc="Helper files to make swayfx a better experience for us poor NVIDIA users."
arch=('any')
url="https://github.com/meeplabsdev/swayfx-nvidia"
license=('MIT')
depends=('swayfx-git' 'vulkan-validation-layers')
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 swayfx-nvidia.sh "$pkgdir/usr/bin/swayfx-nvidia"
  install -Dm644 swayfx-nvidia.desktop "$pkgdir/usr/share/wayland-sessions/swayfx-nvidia.desktop"
  install -Dm644 wlroots-env-nvidia.sh "$pkgdir/usr/share/wlroots-nvidia/wlroots-env-nvidia.sh"
}
