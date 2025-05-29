# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=amdgpu_top-tui-bin
pkgver=0.10.5
pkgrel=1
pkgdesc="Tool to display AMDGPU usage (TUI only version, binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
arch=('x86_64')
depends=('libdrm')
provides=("amdgpu_top")
conflicts=("amdgpu_top")
source=("$url/releases/download/v$pkgver/amdgpu-top_without_gui_${pkgver}-1_amd64.deb")
sha256sums=('81d89c6b4fb55bf117c0d5066d44ccf774fdd9fe47a87260065de2c5ad1d3e9d')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
}
