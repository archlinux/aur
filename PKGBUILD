# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=amdgpu_top-tui-bin
pkgver=0.10.4
pkgrel=1
pkgdesc="Tool to display AMDGPU usage (TUI only version, binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
arch=('x86_64')
depends=('libdrm')
provides=("amdgpu_top")
conflicts=("amdgpu_top")
source=("$url/releases/download/v$pkgver/amdgpu-top_without_gui_${pkgver}-1_amd64.deb")
sha256sums=('df976dcce776541a8a55413b0f12016307412e4532b8ae64beb31146996dfc8d')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
}
