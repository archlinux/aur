# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=amdgpu_top-tui-bin
pkgver=0.11.5
pkgrel=1
pkgdesc="Tool to display AMDGPU usage (TUI only version, binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
arch=('x86_64')
depends=('libdrm')
provides=("amdgpu_top")
conflicts=("amdgpu_top")
source=("$url/releases/download/v$pkgver/amdgpu-top_without_gui_${pkgver}-1_amd64.deb")
sha256sums=('4c35d39d6ce6e60cdd453a84d2c494b23bae6a2bd4d1ca99f33b82f778e46d82')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
}
