# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=amdgpu_top-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Tool to display AMDGPU usage (binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
arch=('x86_64')
depends=('libdrm')
provides=("amdgpu_top")
conflicts=("amdgpu_top")
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}-1_amd64.deb")
sha256sums=('786e0ca355db7a20f8ecaf827f3f3250587f91a18c7d657f8dd4eab7b08f28dd')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
}
