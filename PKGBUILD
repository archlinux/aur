# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=amdgpu_top-tui-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="Tool to display AMDGPU usage (TUI only version, binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
arch=('x86_64')
depends=('libdrm')
provides=("amdgpu_top-tui")
conflicts=("amdgpu_top-tui")
source=("$url/releases/download/v$pkgver/amdgpu-top_without_gui_${pkgver}-1_amd64.deb")
sha256sums=('ff28d955947798c0147362650c99ba9f713578895d5d2451589d19c309767947')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
}
