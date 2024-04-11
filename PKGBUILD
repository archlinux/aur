# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=amdgpu_top-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Tool to display AMDGPU usage (binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
arch=('x86_64')
depends=('libdrm')
provides=("amdgpu_top")
conflicts=("amdgpu_top")
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}-1_amd64.deb")
sha256sums=('8efab5ee665f7c108fd5c2adb89a0878b82f99ee53b2e3edd1427b79376ac7ba')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
}
