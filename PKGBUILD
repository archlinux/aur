# Maintainer: Ben Mitchell <bjosephmitchell@gmail.com>
pkgname=sway-nvidia
pkgver=1.0.7
pkgrel=1
pkgdesc="Helper files to make sway a better experience for us poor NVIDIA users."
arch=('any')
url="https://github.com/crispyricepc/sway-nvidia"
license=('MIT')
depends=('sway' 'vulkan-validation-layers')
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 sway-nvidia.sh "$pkgdir/usr/bin/sway-nvidia"
  install -Dm644 sway-nvidia.desktop "$pkgdir/usr/share/wayland-sessions/sway-nvidia.desktop"
  install -Dm644 wlroots-env-nvidia.sh "$pkgdir/usr/share/wlroots-nvidia/wlroots-env-nvidia.sh"
}
